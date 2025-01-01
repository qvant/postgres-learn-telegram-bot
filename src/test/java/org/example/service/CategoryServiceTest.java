package org.example.service;

import org.example.repository.CategoryRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;


class CategoryServiceTest {

    private static long CATEGORY_ID = 1L;
    private CategoryService categoryService;
    private CategoryRepository categoryRepository;

    @BeforeEach
    public void setUp(){
        categoryRepository = Mockito.mock(CategoryRepository.class);
        categoryService = new CategoryService(categoryRepository);
    }


    @Test
    public void testFindAll() {
        categoryService.findAll();
        Mockito.verify(categoryRepository).findAll();
    }

    @Test
    public void testGetLevel() {
        categoryService.getCategory(CATEGORY_ID);
        Mockito.verify(categoryRepository).findById(CATEGORY_ID);
    }

}