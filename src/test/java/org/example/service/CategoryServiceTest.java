package org.example.service;

import org.example.repository.CategoryRepository;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;


class CategoryServiceTest {

    private static long CATEGORY_ID = 1L;
    @Autowired
    private CategoryService categoryService;


    @Test
    public void testFindAll(){
        CategoryRepository categoryRepository = Mockito.mock(CategoryRepository.class);
        categoryService = new CategoryService(categoryRepository);
        categoryService.findAll();
        Mockito.verify(categoryRepository).findAll();
    }

    @Test
    public void testGetLevel(){
        CategoryRepository categoryRepository = Mockito.mock(CategoryRepository.class);
        categoryService = new CategoryService(categoryRepository);
        categoryService.getCategory(CATEGORY_ID);
        Mockito.verify(categoryRepository).findById(CATEGORY_ID);
    }

}