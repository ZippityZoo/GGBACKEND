SELECT * FROM tourneys t
JOIN brackets b on b.tourney_id = t.tourney_id;

SELECT * FROM brackets b 
WHERE b.tourney_id = ?;

SELECT b.game_name, b.type, u.user_id, u.first_name, u.last_name, u.email, u.tag, u.password, u.title, u.account_created, u.standing FROM user_brackets ub
JOIN brackets b on  ub.bracket_id = b.bracket_id
JOIN users u on ub.user_id = u.user_id;

CREATE TABLE IF NOT EXISTS brackets_new(
    bracket_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,
    tourney_id INT NOT NULL,
    type  TEXT CHECK(type in('single_elimination','double_elimination','siwss','round_robin')),
    game_name VARCHAR(255),
    start_time DATETIME  DEFAULT CURRENT_TIMESTAMP,
    end_sign_up_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tourney_id) REFERENCES tourneys (tourney_id)
);


