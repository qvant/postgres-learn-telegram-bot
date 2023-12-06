package org.example.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration("telegram")
@ConfigurationProperties("telegram")
@Data
public class BotConfig {
    String token;
    String botName;
    List<Long> adminAccounts;
}
