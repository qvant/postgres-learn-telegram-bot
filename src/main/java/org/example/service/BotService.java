package org.example.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.config.BotConfig;
import org.example.domain.Answer;
import org.example.domain.Category;
import org.example.domain.Question;
import org.example.domain.User;
import org.springframework.stereotype.Service;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.InlineKeyboardMarkup;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardButton;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class BotService extends TelegramLongPollingBot {

    private static final String RANDOM_QUESTION = "RANDOM_QUESTION";
    private static final String SELECT_CATEGORY = "SELECT_CATEGORY";
    private static final String ANSWER = "ANSWER";
    private static final String CATEGORY = "CATEGORY";

    private final BotConfig botConfig;
    private final QuestionService questionService;
    private final CategoryService categoryService;
    private final UserService userService;
    @Override
    public String getBotUsername() {
        return botConfig.getBotName();
    }

    @Override
    public String getBotToken() {
        return botConfig.getToken();
    }

    @Override
    public void onUpdateReceived(Update update) {
        if(update.hasMessage() && update.getMessage().hasText()){
            String messageText = update.getMessage().getText();
            long chatId = update.getMessage().getChatId();
            String memberName = update.getMessage().getFrom().getFirstName();

            switch (messageText){
                case "/start":
                    startBot(chatId, memberName);
                    break;
                case RANDOM_QUESTION:
                    sendQuestion(chatId);
                    break;
                default: {log.info("Unexpected message");
                    sendMessage(chatId, update.getMessage().getText(), getMainKeyboard());};
            }
        }
        else {
            log.info("update");
            if (update.hasCallbackQuery() && update.getCallbackQuery().getFrom().getId() != null){
                long chatId = update.getCallbackQuery().getFrom().getId();
                log.info(update.getCallbackQuery().getData());
                log.info(update.getCallbackQuery().getMessage().getText());
                var callback = update.getCallbackQuery().getData();
                if (callback.startsWith(ANSWER)){
                    Long questionId = Long.parseLong(callback.substring(callback.indexOf("_") + 1, callback.indexOf("=")));
                    log.info("questionId {}", questionId);
                    Long answerId = Long.parseLong(callback.substring(callback.indexOf("=") + 1));
                    log.info("answerId {}", answerId);
                    var question = questionService.getQuestion(questionId);
                    if (question.isPresent()){
                        if (question.get().getCorrectAnswer().getId() == answerId){
                            InlineKeyboardMarkup keyboard = getMainKeyboard();
                            sendMessage(chatId, "Correct!", keyboard);
                        }
                        else {
                            InlineKeyboardMarkup keyboard = getMainKeyboard();
                            sendMessage(chatId, "Incorrect :(", keyboard);
                        }
                    }

                }
                else if (callback.startsWith(CATEGORY)){
                    log.info("EEEE");
                    //sendQuestion(chatId);
                    Long categoryId = Long.parseLong(callback.substring(callback.indexOf("_") + 1));
                    Category category = categoryService.getCategory(categoryId).orElseThrow(() -> new RuntimeException("Category " + categoryId + " not found"));
                    userService.setCategory(chatId, category);
                    InlineKeyboardMarkup keyboard = getMainKeyboard();
                    sendMessage(chatId, "Category saved", keyboard);

                }
                else if (callback.startsWith(RANDOM_QUESTION)){
                    log.info("CCCC");
                    sendQuestion(chatId);
                }
                else if (callback.startsWith(SELECT_CATEGORY)){
                    log.info("DDD");
                    sendCategoryList(chatId);
                }
                else {
                    log.info("BBBB");
                }
            }
            else {
                log.info("AAA");
            }
        }
    }


    private void startBot(long chatId, String userName) {
        SendMessage message = new SendMessage();
        message.setChatId((Long.toString(chatId)));
        message.setText("Hello, " + userName + "! I'm a Telegram bot.");
        InlineKeyboardMarkup inlineKeyboardMarkup = new InlineKeyboardMarkup();
        InlineKeyboardButton randomQuestion = new InlineKeyboardButton();
        randomQuestion.setText("Random question");
        randomQuestion.setCallbackData(RANDOM_QUESTION);
        List<InlineKeyboardButton> buttons = List.of(randomQuestion);
        inlineKeyboardMarkup.setKeyboard(List.of(buttons));
        message.setReplyMarkup(inlineKeyboardMarkup);

        try {
            execute(message);
            log.info("Reply sent");
        } catch (TelegramApiException e){
            log.error(e.getMessage());
        }
    }

    private InlineKeyboardMarkup getMainKeyboard(){
        InlineKeyboardMarkup inlineKeyboardMarkup = new InlineKeyboardMarkup();
        InlineKeyboardButton randomQuestion = new InlineKeyboardButton();
        randomQuestion.setText("Random question");
        randomQuestion.setCallbackData(RANDOM_QUESTION);
        InlineKeyboardButton categorySelect = new InlineKeyboardButton();
        categorySelect.setText("Select category");
        categorySelect.setCallbackData(SELECT_CATEGORY);
        List<InlineKeyboardButton> buttons = List.of(randomQuestion, categorySelect);
        inlineKeyboardMarkup.setKeyboard(List.of(buttons));
        return inlineKeyboardMarkup;
    }

    private void sendMessage(long chatId, String text, InlineKeyboardMarkup keyboardMarkup) {
        SendMessage message = new SendMessage();
        message.setChatId((Long.toString(chatId)));
        message.setText(text);
        message.setReplyMarkup(keyboardMarkup);

        try {
            execute(message);
            log.info("Message sent");
        } catch (TelegramApiException e){
            log.error(e.getMessage());
        }
    }
    private void sendQuestion(long chatId) {
        SendMessage message = new SendMessage();
        message.setChatId((Long.toString(chatId)));
        var question = questionService.getQuestion();
        if (question.isPresent()) {
            message.setText(question.get().getText());
            InlineKeyboardMarkup inlineKeyboardMarkup = new InlineKeyboardMarkup();
            List<InlineKeyboardButton> buttons = new ArrayList<>();
            for (Answer answer: question.get().getAnswers()
                 ) {
                InlineKeyboardButton answerButton = new InlineKeyboardButton();
                answerButton.setText(answer.getText());
                answerButton.setCallbackData(ANSWER + "_" + question.get().getId() + "=" + answer.getId());
                log.info("Added button");
                buttons.add(answerButton);
            }
            inlineKeyboardMarkup.setKeyboard(List.of(buttons));
            message.setReplyMarkup(inlineKeyboardMarkup);
        }
        else {
            message.setText("There is no questions");
        }
        try {
            execute(message);
            log.info("Reply sent");
        } catch (TelegramApiException e){
            log.error(e.getMessage());
        }
    }
    private void sendCategoryList(long chatId) {
        SendMessage message = new SendMessage();
        message.setChatId((Long.toString(chatId)));
        var categoryList = categoryService.findAll();
        if (categoryList.size() > 0) {
            message.setText("Select category");
            InlineKeyboardMarkup inlineKeyboardMarkup = new InlineKeyboardMarkup();
            List<InlineKeyboardButton> buttons = new ArrayList<>();
            for (Category category: categoryList
                 ) {
                InlineKeyboardButton categoryButton = new InlineKeyboardButton();
                categoryButton.setText(category.getName());
                categoryButton.setCallbackData(CATEGORY + "_" + category.getId());
                log.info("Added button");
                buttons.add(categoryButton);
            }
            inlineKeyboardMarkup.setKeyboard(List.of(buttons));
            message.setReplyMarkup(inlineKeyboardMarkup);
        }
        else {
            message.setText("There is no categories");
        }
        try {
            execute(message);
            log.info("Reply sent");
        } catch (TelegramApiException e){
            log.error(e.getMessage());
        }
    }
}
