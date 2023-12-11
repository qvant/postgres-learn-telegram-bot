package org.example.domain;

import lombok.Getter;
import org.hibernate.annotations.Fetch;

import javax.persistence.*;
import java.util.List;
import java.util.Stack;

@Getter
@Entity
@Table(name="questions", schema = "telegram_pg_learn_bot")
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "questions_gen")
    @SequenceGenerator(name = "questions_gen", sequenceName = "s_questions", initialValue = 2000, allocationSize=1)
    private Long id;

    private String text;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "question")
    private List<Answer> answers;
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "correct_answer_id", foreignKey=@ForeignKey(name="fk_questions_correct_answer"))
    private Answer correctAnswer;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id", foreignKey=@ForeignKey(name="fk_questions_category"))
    private Category category;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "level_id", foreignKey=@ForeignKey(name="fk_questions_level"))
    private Level level;

}
