package org.example.utility;

import org.telegram.telegrambots.meta.api.objects.replykeyboard.InlineKeyboardMarkup;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardButton;

import java.util.ArrayList;
import java.util.List;

import static org.example.utility.CommandStringsHolder.*;

public class KeyboardUtils {
    private static final int MAX_ROW_LENGTH = 25;

    public static List<List<InlineKeyboardButton>> formatKeyboard(List<InlineKeyboardButton> buttons) {
        List<InlineKeyboardButton> currentRow = new ArrayList<>();
        List<List<InlineKeyboardButton>> keyboard = new ArrayList<>();
        int currentRowTextLength = 0;
        for (InlineKeyboardButton button : buttons
        ) {
            currentRow.add(button);
            currentRowTextLength += button.getText().length();
            if (currentRowTextLength > MAX_ROW_LENGTH) {
                keyboard.add(currentRow);
                currentRow = new ArrayList<>();
                currentRowTextLength = 0;
            }
        }
        if (currentRow.size() > 0) {
            keyboard.add(currentRow);
        }
        return keyboard;
    }

    public static InlineKeyboardMarkup getMainKeyboard() {
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
}
