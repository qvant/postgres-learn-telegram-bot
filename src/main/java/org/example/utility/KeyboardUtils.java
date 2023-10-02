package org.example.utility;

import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardButton;

import java.util.ArrayList;
import java.util.List;

public class KeyboardUtils {
    private static final int MAX_ROW_LENGTH = 30;
    public static List<List<InlineKeyboardButton>> formatKeyboard(List<InlineKeyboardButton> buttons){
        List<InlineKeyboardButton> currentRow = new ArrayList<>();
        List<List<InlineKeyboardButton>> keyboard = new ArrayList<>();
        int currentRowTextLength =0;
        for (InlineKeyboardButton button: buttons
        ) {
            currentRow.add(button);
            currentRowTextLength += button.getText().length();
            if (currentRowTextLength > MAX_ROW_LENGTH){
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
}
