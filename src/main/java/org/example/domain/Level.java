package org.example.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Setter
@Entity
@Table(name = "levels", schema = "telegram_pg_learn_bot")
public class Level {
    @Id
    private Long id;
    private String name;
}
