package org.example.utility;

import org.telegram.telegrambots.meta.api.objects.replykeyboard.InlineKeyboardMarkup;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardButton;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardRow;

import java.util.ArrayList;
import java.util.List;

import static org.example.utility.CommandStringsHolder.*;

public class KeyboardUtils {
    private static final int MAX_ROW_LENGTH = 25;

    public static List<InlineKeyboardRow> formatKeyboard(List<InlineKeyboardButton> buttons) {
        InlineKeyboardRow currentRow = new InlineKeyboardRow();
        List<InlineKeyboardRow> keyboard = new ArrayList<>();
        int currentRowTextLength = 0;
        for (InlineKeyboardButton button : buttons
        ) {
            currentRow.add(button);
            currentRowTextLength += button.getText().length();
            if (currentRowTextLength > MAX_ROW_LENGTH) {
                keyboard.add(currentRow);
                currentRow = new InlineKeyboardRow();
                currentRowTextLength = 0;
            }
        }
        if (currentRow.size() > 0) {
            keyboard.add(currentRow);
        }
        return keyboard;
    }

    public static InlineKeyboardMarkup getMainKeyboard() {
        InlineKeyboardButton randomQuestion = new InlineKeyboardButton("Random question");
        randomQuestion.setCallbackData(RANDOM_QUESTION);
        InlineKeyboardButton categorySelect = new InlineKeyboardButton("Select category");
        categorySelect.setCallbackData(SELECT_CATEGORY);
        InlineKeyboardButton levelSelect = new InlineKeyboardButton("Select level");
        levelSelect.setCallbackData(SELECT_LEVEL);
        InlineKeyboardButton about = new InlineKeyboardButton("About me");
        about.setCallbackData(ABOUT);
        List<InlineKeyboardButton> buttons = List.of(randomQuestion, categorySelect, levelSelect, about);
        return new InlineKeyboardMarkup(formatKeyboard(buttons));
    }
}
