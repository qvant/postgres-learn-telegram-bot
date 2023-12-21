package org.example.domain;

import lombok.Getter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Entity
@Table(name = "levels", schema = "telegram_pg_learn_bot")
public class Level {
    @Id
    private Long id;
    private String name;
}
