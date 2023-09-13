package org.example.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.config.BotConfig;
import org.example.domain.Answer;
import org.example.domain.Question;
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
    private static final String ANSWER = "ANSWER";

    private final BotConfig botConfig;
    private final QuestionService questionService;
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
                    sendMessage(chatId, update.getMessage().getText());};
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
                            sendMessage(chatId, "Correct!");
                        }
                        else {
                            sendMessage(chatId, "Incorrect :(");
                        }
                    }

                }
                else if (callback.startsWith(RANDOM_QUESTION)){
                    log.info("CCCC");
                    sendQuestion(chatId);
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

    private void sendMessage(long chatId, String text) {
        SendMessage message = new SendMessage();
        message.setChatId((Long.toString(chatId)));
        message.setText(text);

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
}
