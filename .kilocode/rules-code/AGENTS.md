# Code Mode Rules (Non-Obvious Only)

- All entities use schema `telegram_pg_learn_bot` explicitly in `@Table` annotation
- Sequence generators must use specific names: `s_categories`, `s_questions`, `s_answers`, `s_users` with initial value 2000
- Bot configuration uses `@Configuration("telegram")` with `@ConfigurationProperties("telegram")` prefix
- Telegram bot extends `TelegramLongPollingBot` (not `TelegramBot`)
- Use `@RequiredArgsConstructor` for dependency injection (not manual constructor injection)
- Use `@Slf4j` for logging (not manual logger creation)
- Static utility classes for constants: `CommandStringsHolder`, `ParserUtils`, `KeyboardUtils`
- Test files must be in `src/test/java/org/example/` matching source package structure
- Tests use `Mockito.mock()` and manual instantiation (not `@InjectMocks`)
- Spring Boot test uses `@SpringBootTest` with `@MockBean` for configuration