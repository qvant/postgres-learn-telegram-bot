package org.example.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.config.BotConfig;
import org.example.domain.*;
import org.example.utility.CommandStringsHolder;
import org.example.utility.KeyboardUtils;
import org.example.utility.ParserUtils;
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
import static org.example.utility.KeyboardUtils.getMainKeyboard;

@Slf4j
@Service
@RequiredArgsConstructor
public class BotService extends TelegramLongPollingBot {

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
        if (update.hasMessage() && update.getMessage().hasText()) {
            String messageText = update.getMessage().getText();
            long chatId = update.getMessage().getChatId();

            switch (messageText) {
                case "/start":
                    startBot(chatId);
                    break;
                case CommandStringsHolder.RANDOM_QUESTION:
                    sendQuestion(chatId);
                    break;
                default: {
                    log.info("Unexpected message {}", messageText);
                    sendMessage(chatId, update.getMessage().getText(), KeyboardUtils.getMainKeyboard());
                }
            }
        } else {
            if (update.hasCallbackQuery() && update.getCallbackQuery().getFrom().getId() != null) {
                long chatId = update.getCallbackQuery().getFrom().getId();
                var callback = update.getCallbackQuery().getData();
                log.info("Received answer callback {} from user {}", callback, chatId);
                if (callback.startsWith(CommandStringsHolder.ANSWER)) {
                    Long questionId = ParserUtils.getQuestionId(callback);
                    Long answerId = ParserUtils.getAnswerId(callback);
                    var question = questionService.getQuestionById(questionId);
                    if (question.isPresent()) {
                        if (question.get().getCorrectAnswer().getId().equals(answerId)) {
                            InlineKeyboardMarkup keyboard = KeyboardUtils.getMainKeyboard();
                            sendMessage(chatId, "Correct!", keyboard);
                        } else {
                            InlineKeyboardMarkup keyboard = KeyboardUtils.getMainKeyboard();
                            sendMessage(chatId, "Incorrect :(", keyboard);
                        }
                    }

                } else if (callback.startsWith(CommandStringsHolder.CATEGORY)) {
                    String categoryCode = ParserUtils.getCode(callback);
                    Category category;
                    String message;
                    if (!categoryCode.equals(CommandStringsHolder.CATEGORY_ALL)) {
                        Long categoryId = ParserUtils.getId(callback);
                        category = categoryService.getCategory(categoryId).orElseThrow(() -> new RuntimeException("Category " + categoryId + " not found"));
                        message = "Category " + category.getName() + " set";
                    } else {
                        category = null;
                        message = "Category \"All questions\" set";
                    }
                    userService.setCategory(chatId, category);
                    InlineKeyboardMarkup keyboard = KeyboardUtils.getMainKeyboard();
                    sendMessage(chatId, message, keyboard);

                } else if (callback.startsWith(CommandStringsHolder.LEVEL)) {
                    String levelCode = ParserUtils.getCode(callback);
                    Level level;
                    String message;
                    if (!levelCode.equals(CommandStringsHolder.LEVEL_ALL)) {
                        Long LevelId = ParserUtils.getId(callback);
                        level = levelService.getLevel(LevelId).orElseThrow(() -> new RuntimeException("Level " + LevelId + " not found"));
                        message = "Level " + level.getName() + " set";
                    } else {
                        level = null;
                        message = "Level \"All levels\" set";
                    }
                    userService.setLevel(chatId, level);
                    InlineKeyboardMarkup keyboard = KeyboardUtils.getMainKeyboard();
                    sendMessage(chatId, message, keyboard);

                } else if (callback.startsWith(CommandStringsHolder.RANDOM_QUESTION)) {
                    sendQuestion(chatId);
                } else if (callback.startsWith(CommandStringsHolder.SELECT_CATEGORY)) {
                    sendCategoryList(chatId);
                } else if (callback.startsWith(CommandStringsHolder.SELECT_LEVEL)) {
                    sendLevelList(chatId);
                } else if (callback.startsWith(CommandStringsHolder.ABOUT)) {
                    sendAbout(chatId);
                } else {
                    log.warn("Unknown callback {} from user {}", callback, chatId);
                }
            } else {
                log.warn("Unhandled update {}", update);
            }
        }
    }


    private void startBot(long chatId) {
        String message = "Hello! I'm a Postgres learning bot.";
        sendMessage(chatId, message, KeyboardUtils.getMainKeyboard());
        log.info("Start bot reply sent to user {}", chatId);
    }

    private void sendMessage(long chatId, String text, InlineKeyboardMarkup keyboardMarkup) {
        SendMessage message = new SendMessage();
        message.setChatId((Long.toString(chatId)));
        message.setText(text);
        if (keyboardMarkup.getKeyboard() != null && keyboardMarkup.getKeyboard().size() > 0) {
            message.setReplyMarkup(keyboardMarkup);
        } else {
            message.setReplyMarkup(getMainKeyboard());
        }
        try {
            execute(message);
            log.info("Message \"{}\" sent to user {}", text, chatId);
        } catch (TelegramApiException e) {
            log.error(e.getMessage());
        }
    }

    private void sendQuestion(long chatId) {
        String message;
        InlineKeyboardMarkup inlineKeyboardMarkup = new InlineKeyboardMarkup();
        User user = userService.findUserByTelegramId(chatId);
        Optional<Question> question = questionService.getQuestionForUser(user);
        if (question.isPresent()) {
            List<InlineKeyboardButton> buttons = new ArrayList<>();
            StringBuilder messageBuilder = new StringBuilder(question.get().getText());
            // Start answer index from capital ASCII A.
            int charIndex = 65;
            for (Answer answer : question.get().getAnswers()
            ) {
                messageBuilder.append("\n").append((char)charIndex).append(") ").append(answer.getText());
                InlineKeyboardButton answerButton = new InlineKeyboardButton();
                answerButton.setText(String.valueOf((char)charIndex));
                answerButton.setCallbackData(CommandStringsHolder.ANSWER + "_" + question.get().getId() + "=" + answer.getId());
                buttons.add(answerButton);
                charIndex++;
            }
            message = messageBuilder.toString();
            inlineKeyboardMarkup.setKeyboard(formatKeyboard(buttons));
        } else {
            message = "There is no questions";
        }
        sendMessage(chatId, message, inlineKeyboardMarkup);
        log.info("Reply {} sent to {}", message, chatId);
    }

    private void sendCategoryList(long chatId) {
        String message;
        InlineKeyboardMarkup inlineKeyboardMarkup = new InlineKeyboardMarkup();
        List<Category> categoryList = categoryService.findAll();
        if (categoryList.size() > 0) {
            message = "Select category";
            List<InlineKeyboardButton> buttons = new ArrayList<>();
            for (Category category : categoryList
            ) {
                InlineKeyboardButton categoryButton = new InlineKeyboardButton();
                categoryButton.setText(category.getName());
                categoryButton.setCallbackData(CommandStringsHolder.CATEGORY + "_" + category.getId());
                buttons.add(categoryButton);
            }
            InlineKeyboardButton emptyButton = new InlineKeyboardButton();
            emptyButton.setText("All categories");
            emptyButton.setCallbackData(CommandStringsHolder.CATEGORY + "_" + CommandStringsHolder.CATEGORY_ALL);
            buttons.add(emptyButton);
            inlineKeyboardMarkup.setKeyboard(formatKeyboard(buttons));
        } else {
            message = "There is no categories";
        }
        sendMessage(chatId, message, inlineKeyboardMarkup);
        log.info("Reply on category select request {} sent to user {}", message, chatId);
    }

    private void sendLevelList(long chatId) {
        String message;
        InlineKeyboardMarkup inlineKeyboardMarkup = new InlineKeyboardMarkup();
        List<Level> levelList = levelService.findAll();
        if (levelList.size() > 0) {
            message = "Select level";
            List<InlineKeyboardButton> buttons = new ArrayList<>();
            for (Level level : levelList
            ) {
                InlineKeyboardButton categoryButton = new InlineKeyboardButton();
                categoryButton.setText(level.getName());
                categoryButton.setCallbackData(CommandStringsHolder.LEVEL + "_" + level.getId());
                buttons.add(categoryButton);
            }
            InlineKeyboardButton emptyButton = new InlineKeyboardButton();
            emptyButton.setText("All levels");
            emptyButton.setCallbackData(CommandStringsHolder.LEVEL + "_" + CommandStringsHolder.LEVEL_ALL);
            buttons.add(emptyButton);
            inlineKeyboardMarkup.setKeyboard(formatKeyboard(buttons));
        } else {
            message = "There is no levels";
        }
        sendMessage(chatId, message, inlineKeyboardMarkup);
        log.info("Reply on level select request {} sent to user {}", message, chatId);
    }

    private void sendAbout(long chatId) {
        String message;
        message = "I'm Postgres learning bot, You can find my source code on https://github.com/qvant/postgres-learn-telegram-bot";
        InlineKeyboardMarkup keyboard = KeyboardUtils.getMainKeyboard();
        sendMessage(chatId, message, keyboard);
        log.info("About message {} sent to user {}", message, chatId);
    }

    @PostConstruct
    public void notifyAdmins() {
        InlineKeyboardMarkup keyboard = KeyboardUtils.getMainKeyboard();
        for (Long adminChatId : botConfig.getAdminAccounts()
        ) {
            log.info("Notify admin {} about bot start", adminChatId);
            try {
                sendMessage(adminChatId, "Bot started", keyboard);
            } catch (Exception exception) {
                log.error("{} when send start notification to {}", exception.getMessage(), adminChatId);
            }
        }
        log.info("All {} admins were notified", botConfig.getAdminAccounts().size());
    }

}
