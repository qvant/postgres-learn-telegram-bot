package org.example.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.config.BotConfig;
import org.springframework.stereotype.Service;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.InlineKeyboardMarkup;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardButton;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class BotService extends TelegramLongPollingBot {

    private final BotConfig botConfig;
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
                case "RANDOM_QUESTION":
                    sendQuestion(chatId, memberName);
                    break;
                default: {log.info("Unexpected message");
                    sendMessage(chatId, update.getMessage().getText());};
            }
        }
        else {
            log.info("update");
            if (update.hasCallbackQuery() && update.getCallbackQuery().getFrom().getId() != null){
                long chatId = update.getCallbackQuery().getFrom().getId();
                sendQuestion(chatId, "memberName");
            }
        }
    }



    private void startBot(long chatId, String userName) {
        SendMessage message = new SendMessage();
        message.setChatId((Long.toString(chatId)));
        message.setText("Hello, " + userName + "! I'm a Telegram bot.");
        InlineKeyboardMarkup inlineKeyboardMarkup = new InlineKeyboardMarkup();
        InlineKeyboardButton randowQuestion = new InlineKeyboardButton();
        randowQuestion.setText("Random question");
        randowQuestion.setCallbackData("RANDOM_QUESTION");
        List<InlineKeyboardButton> buttons = List.of(randowQuestion);
        inlineKeyboardMarkup.setKeyboard(List.of(buttons));
        message.setReplyMarkup(inlineKeyboardMarkup);

        try {
            execute(message);
            log.info("Reply sent");
        } catch (TelegramApiException e){
            log.error(e.getMessage());
        }
    }

    private void sendMessage(long chatId, String userName) {
        SendMessage message = new SendMessage();
        message.setChatId((Long.toString(chatId)));
        message.setText(userName);

        try {
            execute(message);
            log.info("Reply sent");
        } catch (TelegramApiException e){
            log.error(e.getMessage());
        }
    }
    private void sendQuestion(long chatId, String userName) {
        SendMessage message = new SendMessage();
        message.setChatId((Long.toString(chatId)));
        message.setText("RANDOM");

        try {
            execute(message);
            log.info("Reply sent");
        } catch (TelegramApiException e){
            log.error(e.getMessage());
        }
    }
}
