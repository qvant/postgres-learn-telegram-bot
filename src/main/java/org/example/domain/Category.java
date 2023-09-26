package org.example.domain;

import lombok.Getter;

import javax.persistence.*;

@Getter
@Entity
@Table(name="categories")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "categories_gen")
    @SequenceGenerator(name = "categories_gen", sequenceName = "s_categories", initialValue = 2000)
    private Long id;
    private String name;
}
