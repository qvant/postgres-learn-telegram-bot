# Debug Mode Rules (Non-Obvious Only)

- Logs are written to `logs/bot.log` with rolling file pattern `bot-%d{yyyy-MM-dd}.%i.log`
- Spring Boot test uses `@SpringBootTest` with `@MockBean` for configuration
- Tests use `Mockito.mock()` and manual instantiation (not `@InjectMocks`)
- Test files must be in `src/test/java/org/example/` matching source package structure
- Spring Boot test uses `@SpringBootTest` with `@MockBean` for configuration