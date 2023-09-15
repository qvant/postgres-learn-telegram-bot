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
    Long id;

    String text;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "question")
    List<Answer> answers;
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "correct_answer_id")
    Answer correctAnswer;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    Category category;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "level_id")
    Level level;

}
