package org.example.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.domain.Category;
import org.example.domain.Level;
import org.example.domain.Question;
import org.example.domain.User;
import org.example.repository.CategoryRepository;
import org.example.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {
    private final UserRepository repository;
    public User findUserByTelegramId(Long id){
        User user = repository.findUserByTelegramId(id).orElse(new User());
        if (user.getTelegramId() == null){
            user.setTelegramId(id);
        }
        return user;
    }

    @Transactional
    public void setCategory(Long id, Category category){
        User user = repository.findUserByTelegramId(id).orElse(new User());
        if (user.getTelegramId() == null){
            user.setTelegramId(id);
        }
        user.setCategory(category);
        repository.save(user);
        if (category != null) {
            log.info("Set category {} for user {} [{}]", category.getName(), user.getTelegramId(), user.getId());
        }
        else {
            log.info("Set null category for user {} [{}]", user.getTelegramId(), user.getId());
        }
    }@Transactional
    public void setLevel(Long id, Level level){
        User user = repository.findUserByTelegramId(id).orElse(new User());
        if (user.getTelegramId() == null){
            user.setTelegramId(id);
        }
        user.setLevel(level);
        repository.save(user);
        if (level != null) {
            log.info("Set level {} for user {} [{}]", level.getName(), user.getTelegramId(), user.getId());
        }
        else {
            log.info("Set null level for user {} [{}]", user.getTelegramId(), user.getId());
        }
    }

}
