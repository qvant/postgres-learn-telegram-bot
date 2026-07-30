package org.example.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "levels", schema = "telegram_pg_learn_bot")
public class Level {
    @Id
    private Long id;
    private String name;
}
