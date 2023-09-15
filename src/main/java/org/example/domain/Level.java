package org.example.domain;

import lombok.Getter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Entity
@Table(name="levels")
public class Level {
    @Id
    Long id;
    String name;
}
