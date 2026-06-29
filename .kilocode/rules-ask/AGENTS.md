# Ask Mode Rules (Non-Obvious Only)

- PostgreSQL schema is explicitly `telegram_pg_learn_bot` (not default public schema)
- All entities use `@Table(name = "entity_name", schema = "telegram_pg_learn_bot")`
- Sequence generators use specific names: `s_categories`, `s_questions`, `s_answers`, `s_users`
- Sequence initial values are 2000 (not 1)
- Liquibase migrations in `src/main/resources/db/changelog/`
- Data seeding in `src/main/resources/data.sql` (runs on startup)
- Build JAR: `mvn clean package` (creates `target/postgres-telegram-bot.jar`)
- Run tests: `mvn test` (tests run from project root)
- Start bot: `java -jar target/postgres-telegram-bot.jar`
- Use `@RequiredArgsConstructor` for dependency injection (not manual constructor injection)
- Use `@Slf4j` for logging (not manual logger creation)
- Use `@Getter` and `@Setter` from Lombok (not manual getters/setters)
- Bot configuration uses `@Configuration("telegram")` with `@ConfigurationProperties("telegram")`
- Telegram bot extends `TelegramLongPollingBot` (not TelegramBot)
- Static utility classes for constants: `CommandStringsHolder`, `ParserUtils`, `KeyboardUtils`
- Test files must be in `src/test/java/org/example/` matching source package structure
- Tests use `Mockito.mock()` and manual instantiation (not `@InjectMocks`)
- Spring Boot test uses `@SpringBootTest` with `@MockBean` for configuration