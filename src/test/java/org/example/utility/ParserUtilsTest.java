package org.example.utility;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ParserUtilsTest {

    @Test
    void getQuestionId() {
        assertEquals(1, ParserUtils.getQuestionId(CommandStringsHolder.ANSWER + "_1=2"));
    }

    @Test
    void getAnswerId() {
        assertEquals(2, ParserUtils.getAnswerId(CommandStringsHolder.ANSWER + "_1=2"));
    }

    @Test
    void getId() {
        assertEquals(2L, ParserUtils.getId(CommandStringsHolder.CATEGORY + "_2"));
        assertEquals(1L, ParserUtils.getId(CommandStringsHolder.LEVEL + "_1"));
    }

    @Test
    void getCode() {
        assertEquals("1", ParserUtils.getCode(CommandStringsHolder.LEVEL + "_1"));
        assertEquals("ALL", ParserUtils.getCode(CommandStringsHolder.LEVEL_ALL) );
        assertEquals("2", ParserUtils.getCode(CommandStringsHolder.CATEGORY + "_2"));
        assertEquals("ALL", ParserUtils.getCode(CommandStringsHolder.CATEGORY_ALL));
    }
}