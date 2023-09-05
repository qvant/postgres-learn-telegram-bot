package org.example.domain;

import javax.persistence.*;
import java.util.List;
import java.util.Stack;

@Entity
@Table(name="questions")
public class Question {
    @Id
    Long id;
    String text;
    @OneToMany
    List<Answer> answers;
    @OneToOne
    @JoinColumn(name = "correct_answer_id")
    Answer correctAnswer;

    public Answer getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(Answer correctAnswer) {
        this.correctAnswer = correctAnswer;
    }
}
