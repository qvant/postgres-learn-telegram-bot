package org.example.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration("telegram")
@ConfigurationProperties("telegram")
@Data
public class BotConfig {
    String token;
    String botName;
}
