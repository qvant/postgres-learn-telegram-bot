package org.example.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import lombok.Setter;

@Getter
@NoArgsConstructor
@Entity
@Table(name = "answers", schema = "telegram_pg_learn_bot")
public class Answer {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "answers_gen")
    @SequenceGenerator(name = "answers_gen", sequenceName = "s_answers", initialValue = 2000, allocationSize = 1)
    private Long id;
    private String text;
    @Setter
    @ManyToOne
    @JoinColumn(name = "question_id", foreignKey = @ForeignKey(name = "fk_answers_question"))
    private Question question;

}
