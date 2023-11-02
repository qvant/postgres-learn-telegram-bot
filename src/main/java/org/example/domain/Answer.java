package org.example.domain;

import lombok.Getter;

import javax.persistence.*;

@Getter
@Entity
@Table(name="answers", schema = "telegram_pg_learn_bot")
public class Answer {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "answers_gen")
    @SequenceGenerator(name = "answers_gen", sequenceName = "s_answers", initialValue = 2000)
    private Long id;
    private String text;
    @ManyToOne
    @JoinColumn(name = "question_id", foreignKey=@ForeignKey(name="fk_answers_question"))
    private Question question;

    public void setQuestion(Question question) {
        this.question = question;
    }
}
