package org.example.domain;

import lombok.Getter;
import org.hibernate.annotations.Fetch;

import javax.persistence.*;
import java.util.List;
import java.util.Stack;

@Getter
@Entity
@Table(name="questions")
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "questions_gen")
    @SequenceGenerator(name = "questions_gen", sequenceName = "S_QUESTIONS", initialValue = 2000)
    private Long id;

    private String text;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "question")
    private List<Answer> answers;
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "correct_answer_id")
    private Answer correctAnswer;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category category;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "level_id")
    private Level level;

}
