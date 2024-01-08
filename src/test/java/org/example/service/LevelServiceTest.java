package org.example.service;

import org.aspectj.lang.annotation.Before;
import org.example.domain.Level;
import org.example.repository.LevelRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;


class LevelServiceTest {

    private static long LEVEL_ID = 1L;
    @Autowired
    private LevelService levelService;


    @Test
    public void testFindAll(){
        LevelRepository levelRepository = Mockito.mock(LevelRepository.class);
        levelService = new LevelService(levelRepository);
        levelService.findAll();
        Mockito.verify(levelRepository).findAll();
    }

    @Test
    public void testGetLevel(){
        LevelRepository levelRepository = Mockito.mock(LevelRepository.class);
        levelService = new LevelService(levelRepository);
        levelService.getLevel(LEVEL_ID);
        Mockito.verify(levelRepository).findById(LEVEL_ID);
    }

}