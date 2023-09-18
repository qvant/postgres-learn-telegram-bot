package org.example.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Entity
@Table(name="users")
public class User {
    @Id
    private Long id;
    @Setter
    private Long telegramId;
    @ManyToOne(fetch = FetchType.EAGER)
    @Setter
    private Category category;
}
