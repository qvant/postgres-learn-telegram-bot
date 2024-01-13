package org.example.service;

import org.example.repository.LevelRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;


class LevelServiceTest {

    private static long LEVEL_ID = 1L;
    private LevelService levelService;
    private LevelRepository levelRepository;

    @BeforeEach
    public void setUp() {
        levelRepository = Mockito.mock(LevelRepository.class);
        levelService = new LevelService(levelRepository);
    }


    @Test
    public void testFindAll() {
        levelService.findAll();
        Mockito.verify(levelRepository).findAll();
    }

    @Test
    public void testGetLevel() {
        levelService.getLevel(LEVEL_ID);
        Mockito.verify(levelRepository).findById(LEVEL_ID);
    }

}