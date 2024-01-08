package org.example.service;

import org.example.domain.Category;
import org.example.domain.Level;
import org.example.domain.Question;
import org.example.domain.User;
import org.example.repository.LevelRepository;
import org.example.repository.QuestionRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


class QuestionServiceTest {

    private static long QUESTION_ID = 1L;
    private static long LEVEL_ID = 2L;
    private static long CATEGORY_ID = 3L;
    @Autowired
    private QuestionService questionService;

    @Test
    public void testFindById(){
        QuestionRepository questionRepository = Mockito.mock(QuestionRepository.class);
        questionService = new QuestionService(questionRepository);
        questionService.getQuestionById(QUESTION_ID);
        Mockito.verify(questionRepository).findById(QUESTION_ID);
    }

    @Test
    public void testFindByUserSimple(){
        QuestionRepository questionRepository = Mockito.mock(QuestionRepository.class);
        Question question = new Question();
        Mockito.when(questionRepository.findAll()).thenReturn(List.of(question));
        questionService = new QuestionService(questionRepository);
        User user = new User();
        var returnedQuestion = questionService.getQuestionForUser(user);
        Assertions.assertEquals(returnedQuestion.get(), question);
        Mockito.verify(questionRepository).findAll();
    }

    @Test
    public void testFindByUserWithCategory(){
        QuestionRepository questionRepository = Mockito.mock(QuestionRepository.class);
        Question question = new Question();
        Mockito.when(questionRepository.findByCategoryId(CATEGORY_ID)).thenReturn(List.of(question));
        questionService = new QuestionService(questionRepository);
        User user = new User();
        Category category = new Category();
        category.setId(CATEGORY_ID);
        user.setCategory(category);
        var returnedQuestion = questionService.getQuestionForUser(user);
        Assertions.assertEquals(returnedQuestion.get(), question);
        Mockito.verify(questionRepository).findByCategoryId(CATEGORY_ID);
    }

    @Test
    public void testFindByUserWithLevel(){
        QuestionRepository questionRepository = Mockito.mock(QuestionRepository.class);
        Question question = new Question();
        Mockito.when(questionRepository.findByLevelId(LEVEL_ID)).thenReturn(List.of(question));
        questionService = new QuestionService(questionRepository);
        User user = new User();
        Level level = new Level();
        level.setId(LEVEL_ID);
        user.setLevel(level);
        var returnedQuestion = questionService.getQuestionForUser(user);
        Assertions.assertEquals(returnedQuestion.get(), question);
        Mockito.verify(questionRepository).findByLevelId(LEVEL_ID);
    }

    @Test
    public void testFindByUserWithCategoryAndLevel(){
        QuestionRepository questionRepository = Mockito.mock(QuestionRepository.class);
        Question question = new Question();
        Mockito.when(questionRepository.findByCategoryIdAndLevelId(CATEGORY_ID, LEVEL_ID)).thenReturn(List.of(question));
        questionService = new QuestionService(questionRepository);
        User user = new User();
        Category category = new Category();
        category.setId(CATEGORY_ID);
        user.setCategory(category);
        Level level = new Level();
        level.setId(LEVEL_ID);
        user.setLevel(level);
        var returnedQuestion = questionService.getQuestionForUser(user);
        Assertions.assertEquals(returnedQuestion.get(), question);
        Mockito.verify(questionRepository).findByCategoryIdAndLevelId(CATEGORY_ID, LEVEL_ID);
    }

}