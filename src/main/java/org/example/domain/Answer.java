package org.example.domain;

import lombok.Getter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Entity
@Table(name="answers")
public class Answer {
    @Id
    Long id;
    String text;
}
