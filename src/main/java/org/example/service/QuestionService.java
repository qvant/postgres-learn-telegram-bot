package org.example.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.domain.Category;
import org.example.domain.Level;
import org.example.domain.Question;
import org.example.domain.User;
import org.example.repository.QuestionRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class QuestionService {
    private final QuestionRepository repository;

    private static Optional<Question> selectQuestion(List<Question> questions) {
        if (questions.size() > 0) {
            return Optional.of(questions.get((int) (Math.random() * questions.size())));
        }
        return Optional.empty();
    }


    private Optional<Question> getQuestion() {
        List<Question> questions = repository.findAll();
        return selectQuestion(questions);
    }

    private Optional<Question> getQuestionByCategory(Long categoryId) {
        List<Question> questions = repository.findByCategoryId(categoryId);
        return selectQuestion(questions);
    }

    private Optional<Question> getQuestionByCategoryAndLevel(Long categoryId, Long levelId) {
        List<Question> questions = repository.findByCategoryIdAndLevelId(categoryId, levelId);
        return selectQuestion(questions);
    }

    private Optional<Question> getQuestionByLevel(Long levelId) {
        List<Question> questions = repository.findByLevelId(levelId);
        return selectQuestion(questions);
    }

    public Optional<Question> getQuestionById(Long id) {
        return repository.findById(id);
    }

    public Optional<Question> getQuestionForUser(User user){
        Category category = user.getCategory();
        Level level = user.getLevel();
        Optional<Question> question;
        if (category != null && level != null) {
            log.info("Select question for category {}, level {} and user {}", category.getName(), level.getName(), user.getTelegramId());
            question = getQuestionByCategoryAndLevel(category.getId(), level.getId());
        } else if (category != null) {
            log.info("Select question for category {} and user {}", category.getName(), user.getTelegramId());
            question = getQuestionByCategory(category.getId());
        } else if (level != null) {
            log.info("Select question for category {} and user {}", level.getName(), user.getTelegramId());
            question = getQuestionByLevel(level.getId());
        } else {
            log.info("Select random question for user {}", user.getTelegramId());
            question = getQuestion();
        }
        return question;
    }
}
