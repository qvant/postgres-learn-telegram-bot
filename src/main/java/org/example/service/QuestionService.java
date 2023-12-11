package org.example.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.domain.Question;
import org.example.repository.QuestionRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class QuestionService {
    private final QuestionRepository repository;

    private static Optional<Question> selectQuestion(List<Question> questions){
        if (questions.size() > 0){
            return Optional.of(questions.get((int) (Math.random() * questions.size())));
        }
        return Optional.empty();
    }


    public Optional <Question> getQuestion(){
        List<Question> questions = repository.findAll();
        return selectQuestion(questions);
    }

    public Optional <Question> getQuestionByCategory(Long categoryId){
        List<Question> questions = repository.findByCategoryId(categoryId);
        return selectQuestion(questions);
    }
    public Optional <Question> getQuestionByCategoryAndLevel(Long categoryId, Long levelId){
        List<Question> questions = repository.findByCategoryIdAndLevelId(categoryId, levelId);
        return selectQuestion(questions);
    }
    public Optional <Question> getQuestionByLevel(Long levelId){
        List<Question> questions = repository.findByLevelId(levelId);
        return selectQuestion(questions);
    }

    public Optional <Question> getQuestion(Long id){
        return repository.findById(id);
    }
}
