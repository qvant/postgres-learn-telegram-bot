package org.example.utility;

public class ParserUtils {
    public static long getQuestionId(String message) {
        return Long.parseLong(message.substring(message.indexOf("_") + 1, message.indexOf("=")));
    }

    public static long getAnswerId(String message) {
        return Long.parseLong(message.substring(message.indexOf("=") + 1));
    }

    public static long getId(String message) {
        return Long.parseLong(message.substring(message.indexOf("_") + 1));
    }

    public static String getCode(String message) {
        return message.substring(message.indexOf("_") + 1);
    }
}
