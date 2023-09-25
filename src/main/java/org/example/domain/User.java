package org.example.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Entity
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "users_gen")
    @SequenceGenerator(name = "users_gen", sequenceName = "S_USERS", initialValue = 2000)
    private Long id;
    @Setter
    private Long telegramId;
    @ManyToOne(fetch = FetchType.EAGER)
    @Setter
    private Category category;
}
