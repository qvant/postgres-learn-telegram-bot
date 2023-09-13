package org.example.domain;

import lombok.Getter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Entity
@Table(name="categories")
public class Category {
    @Id
    Long id;
    String name;
}
