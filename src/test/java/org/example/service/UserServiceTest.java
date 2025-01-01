package org.example.service;

import org.example.domain.Category;
import org.example.domain.Level;
import org.example.domain.User;
import org.example.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

class UserServiceTest {

    private static long TELEGRAM_ID = 1;

    private UserService service;
    private UserRepository repository;
    @BeforeEach
    public void setUp(){
        repository = Mockito.mock(UserRepository.class);
        service = new UserService(repository);
    }

    @Test
    void findUserByTelegramId() {
        service.findUserByTelegramId(TELEGRAM_ID);
        Mockito.verify(repository).findUserByTelegramId(TELEGRAM_ID);
    }

    @Test
    void setCategory() {
        Category category = new Category();
        User user = Mockito.mock(User.class);
        Mockito.when(repository.findUserByTelegramId(TELEGRAM_ID)).thenReturn(Optional.of(user));
        service.setCategory(TELEGRAM_ID, category);
        Mockito.verify(repository).save(user);
        Mockito.verify(user).enrichTelegramId(TELEGRAM_ID);
        Mockito.verify(user).setCategory(category);
    }

    @Test
    void setLevel() {
        Level level = new Level();
        User user = Mockito.mock(User.class);
        Mockito.when(repository.findUserByTelegramId(TELEGRAM_ID)).thenReturn(Optional.of(user));
        service.setLevel(TELEGRAM_ID, level);
        Mockito.verify(repository).save(user);
        Mockito.verify(user).enrichTelegramId(TELEGRAM_ID);
        Mockito.verify(user).setLevel(level);
    }
}