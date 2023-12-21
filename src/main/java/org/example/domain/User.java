package org.example.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Entity
@Table(name = "users", schema = "telegram_pg_learn_bot")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "users_gen")
    @SequenceGenerator(name = "users_gen", sequenceName = "s_users", initialValue = 2000, allocationSize = 1)
    private Long id;
    @Setter
    private Long telegramId;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id", foreignKey = @ForeignKey(name = "fk_users_category"))
    @Setter
    private Category category;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "level_id", foreignKey = @ForeignKey(name = "fk_users_level"))
    @Setter
    private Level level;

    public void enrichTelegramId(Long newTelegramId) {
        if (telegramId == null) {
            telegramId = newTelegramId;
        }
    }
}
