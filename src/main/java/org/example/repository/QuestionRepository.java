package org.example.repository;

import org.example.domain.Question;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuestionRepository extends JpaRepository<Question, Long> {

    List<Question> findByCategoryId(Long categoryId);

    List<Question> findByLevelId(Long levelId);

    List<Question> findByCategoryIdAndLevelId(Long categoryId, Long levelId);
}
