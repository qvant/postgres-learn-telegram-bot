package org.example.domain;

import lombok.Getter;

import javax.persistence.*;

@Getter
@Entity
@Table(name="answers")
public class Answer {
    @Id
    private Long id;
    private String text;
    @ManyToOne
    @JoinColumn(name = "question_id")
    private Question question;

    public void setQuestion(Question question) {
        this.question = question;
    }
}
