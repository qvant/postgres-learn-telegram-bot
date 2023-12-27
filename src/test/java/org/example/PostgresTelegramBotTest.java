package org.example;

import org.example.config.BotConfig;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.telegram.telegrambots.starter.TelegramBotStarterConfiguration;

@SpringBootTest
class PostgresTelegramBotTest {

    @MockBean
    private BotConfig botConfig;
    @MockBean
    private TelegramBotStarterConfiguration telegramBotStarterConfiguration;

    @Test
    void contextLoads() {
    }
}
