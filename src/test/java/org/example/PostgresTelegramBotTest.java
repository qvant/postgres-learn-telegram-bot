package org.example;

import org.example.config.BotConfig;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.telegram.telegrambots.longpolling.starter.TelegramBotStarterConfiguration;

@SpringBootTest
class PostgresTelegramBotTest {

    @MockitoBean
    private BotConfig botConfig;
    @MockitoBean
    private TelegramBotStarterConfiguration telegramBotStarterConfiguration;

    @Test
    void contextLoads() {
    }
}
