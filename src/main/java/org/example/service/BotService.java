package org.example.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.config.BotConfig;
import org.example.domain.Answer;
import org.example.domain.Category;
import org.example.domain.Level;
import org.example.domain.Question;
import org.springframework.stereotype.Service;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.InlineKeyboardMarkup;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardButton;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.example.utility.KeyboardUtils.formatKeyboard;

@Slf4j
@Service
@RequiredArgsConstructor
public class BotService extends TelegramLongPollingBot {

    private static final String RANDOM_QUESTION = "RANDOM_QUESTION";
    private static final String SELECT_CATEGORY = "SELECT_CATEGORY";
    private static final String SELECT_LEVEL = "SELECT_LEVEL";
    private static final String ABOUT = "ABOUT";
    private static final String ANSWER = "ANSWER";
    private static final String CATEGORY = "CATEGORY";
    private static final String LEVEL = "LEVEL";
    private static final String CATEGORY_ALL = "ALL";
    private static final String LEVEL_ALL = "ALL";

    private final BotConfig botConfig;
    private final QuestionService questionService;
    private final CategoryService categoryService;
    private final LevelService levelService;
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
                        if (question.get().getCorrectAnswer().getId().equals(answerId)){
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
                    String categoryCode =  callback.substring(callback.indexOf("_") + 1);
                    Category category;
                    if (!categoryCode.equals(CATEGORY_ALL)) {
                        Long categoryId = Long.parseLong(callback.substring(callback.indexOf("_") + 1));
                        category = categoryService.getCategory(categoryId).orElseThrow(() -> new RuntimeException("Category " + categoryId + " not found"));
                    }
                    else{
                        category = null;
                    }
                    userService.setCategory(chatId, category);
                    InlineKeyboardMarkup keyboard = getMainKeyboard();
                    sendMessage(chatId, "Category saved", keyboard);

                }
                else if (callback.startsWith(LEVEL)){
                    String levelCode =  callback.substring(callback.indexOf("_") + 1);
                    Level level;
                    if (!levelCode.equals(LEVEL_ALL)) {
                        Long LevelId = Long.parseLong(callback.substring(callback.indexOf("_") + 1));
                        level = levelService.getLevel(LevelId).orElseThrow(() -> new RuntimeException("Level " + LevelId + " not found"));
                    }
                    else{
                        level = null;
                    }
                    userService.setLevel(chatId, level);
                    InlineKeyboardMarkup keyboard = getMainKeyboard();
                    sendMessage(chatId, "Category saved", keyboard);

                }
                else if (callback.startsWith(RANDOM_QUESTION)){
                    sendQuestion(chatId);
                }
                else if (callback.startsWith(SELECT_CATEGORY)){
                    sendCategoryList(chatId);
                }
                else if (callback.startsWith(SELECT_LEVEL)){
                    sendLevelList(chatId);
                }
                else if (callback.startsWith(ABOUT)){
                    sendAbout(chatId);
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
        InlineKeyboardMarkup inlineKeyboardMarkup = getMainKeyboard();
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
        InlineKeyboardButton levelSelect = new InlineKeyboardButton();
        levelSelect.setText("Select level");
        levelSelect.setCallbackData(SELECT_LEVEL);
        InlineKeyboardButton about = new InlineKeyboardButton();
        about.setText("About me");
        about.setCallbackData(ABOUT);
        List<InlineKeyboardButton> buttons = List.of(randomQuestion, categorySelect, levelSelect, about);
        inlineKeyboardMarkup.setKeyboard(formatKeyboard(buttons));
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
        var user = userService.findUserByTelegramId(chatId);
        Optional<Question> question;
        Category category = user.getCategory();
        Level level = user.getLevel();
        if (category != null && level != null) {
            log.info("Select question for category {}, level {} and user {}", category.getName(), level.getName(), chatId);
            question = questionService.getQuestionByCategoryAndLevel(category.getId(), level.getId());
        }
        else if (category != null){
            log.info("Select question for category {} and user {}", category.getName(), chatId);
            question = questionService.getQuestionByCategory(category.getId());
        }
        else if (level != null){
            log.info("Select question for category {} and user {}", level.getName(), chatId);
            question = questionService.getQuestionByLevel(level.getId());
        }
        else {
            log.info("Select random question for user {}", chatId);
            question = questionService.getQuestion();
        }
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
            inlineKeyboardMarkup.setKeyboard(formatKeyboard(buttons));
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
            InlineKeyboardButton emptyButton = new InlineKeyboardButton();
            emptyButton.setText("All categories");
            emptyButton.setCallbackData(CATEGORY + "_" + CATEGORY_ALL);
            buttons.add(emptyButton);
            inlineKeyboardMarkup.setKeyboard(formatKeyboard(buttons));
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

    private void sendLevelList(long chatId) {
        SendMessage message = new SendMessage();
        message.setChatId((Long.toString(chatId)));
        var levelList = levelService.findAll();
        if (levelList.size() > 0) {
            message.setText("Select level");
            InlineKeyboardMarkup inlineKeyboardMarkup = new InlineKeyboardMarkup();
            List<InlineKeyboardButton> buttons = new ArrayList<>();
            for (Level level: levelList
            ) {
                InlineKeyboardButton categoryButton = new InlineKeyboardButton();
                categoryButton.setText(level.getName());
                categoryButton.setCallbackData(LEVEL + "_" + level.getId());
                log.info("Added button");
                buttons.add(categoryButton);
            }
            InlineKeyboardButton emptyButton = new InlineKeyboardButton();
            emptyButton.setText("All levels");
            emptyButton.setCallbackData(LEVEL + "_" + LEVEL_ALL);
            buttons.add(emptyButton);
            inlineKeyboardMarkup.setKeyboard(formatKeyboard(buttons));
            message.setReplyMarkup(inlineKeyboardMarkup);
        }
        else {
            message.setText("There is no levels");
        }
        try {
            execute(message);
            log.info("Reply sent");
        } catch (TelegramApiException e){
            log.error(e.getMessage());
        }
    }

    private void sendAbout(long chatId) {
        SendMessage message = new SendMessage();
        message.setChatId((Long.toString(chatId)));
        message.setText("I'm pg learning bot, You can find mu source code on https://github.com/qvant/postgres-learn-telegram-bot");
        InlineKeyboardMarkup keyboard = getMainKeyboard();
        message.setReplyMarkup(keyboard);
        try {
            execute(message);
            log.info("Reply sent");
        } catch (TelegramApiException e){
            log.error(e.getMessage());
        }
    }

    @PostConstruct
    public void notifyAdmins(){
        InlineKeyboardMarkup keyboard = getMainKeyboard();
        for (Long adminChatId: botConfig.getAdminAccounts()
             ) {
            log.info("Notify admin {} about bot start", adminChatId);
            try {
                sendMessage(adminChatId, "Bot started", keyboard);
            } catch (Exception exception){
                log.error("{} when send start notification to {}", exception.getMessage(), adminChatId);
            }
        }
        log.info("All admins were notified");
    }

}
