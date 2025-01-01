package org.example.utility;

import org.junit.jupiter.api.Test;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardButton;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

class KeyboardUtilsTest {

    @Test
    public void getMainKeyboardTest()
    {
        var mainKeyboard = KeyboardUtils.getMainKeyboard();
        assertEquals(mainKeyboard.getKeyboard().size(), 2);
        var firstRow = mainKeyboard.getKeyboard().get(0);
        assertEquals(firstRow.size(), 2);
        assertEquals(firstRow.get(0).getText(), "Random question");
        assertEquals(firstRow.get(1).getText(), "Select category");
        var secondRow = mainKeyboard.getKeyboard().get(1);
        assertEquals(secondRow.size(), 2);
        assertEquals(secondRow.get(0).getText(), "Select level");
        assertEquals(secondRow.get(1).getText(), "About me");
    }

    @Test
    public void formatKeyboardTest(){
        ArrayList<InlineKeyboardButton> buttons = new ArrayList<>();
        for (int i = 0; i < 29; i++){
            buttons.add(new InlineKeyboardButton("Button " + i));
        }
        var keyboard = KeyboardUtils.formatKeyboard(buttons);
        assertEquals(keyboard.size(), 9);
        assertEquals(keyboard.get(0).size(), 4);
        assertEquals(keyboard.get(1).size(), 4);
        assertEquals(keyboard.get(2).size(), 4);
        assertEquals(keyboard.get(3).size(), 3);
        assertEquals(keyboard.get(4).size(), 3);
        assertEquals(keyboard.get(5).size(), 3);
        assertEquals(keyboard.get(6).size(), 3);
        assertEquals(keyboard.get(7).size(), 3);
        assertEquals(keyboard.get(8).size(), 2);
    }
}