PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS users(
    user_id INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    tag VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    account_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    standing VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS user_history(
    user_id INT NOT NULL,
    bracket_id INT NOT NULL,
    user_place INT,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (bracket_id) REFERENCES users (bracket_id)
);
--TODO:should add in best ofs in 
CREATE TABLE IF NOT EXISTS brackets(
    bracket_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,
    tourney_id INT NOT NULL,
    type  TEXT CHECK(type in('single_elimination','double_elimination','siwss','round_robin')),
    game_name VARCHAR(255),
    start_time DATETIME  DEFAULT CURRENT_TIMESTAMP,
    end_sign_up_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tourney_id) REFERENCES tourneys (tourney_id)
);
--tourneys have multiple brackets
CREATE TABLE IF NOT EXISTS tourneys(
    tourney_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) DEFAULT 'online',
    start_date DATETIME  DEFAULT CURRENT_TIMESTAMP,
    end_date DATETIME  DEFAULT CURRENT_TIMESTAMP
);
--user to bracket connection
CREATE TABLE IF NOT EXISTS user_brackets(
    user_id INT NOT NULL,
    bracket_id INT NOT NULL,
    date_signed_up DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (bracket_id) REFERENCES brackets (bracket_id)
);
--save the custom seed
CREATE TABLE IF NOT EXISTS bracket_seeding(
    user_id INT NOT NULL,
    bracket_id INT NOT NULL,
    user_seed INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (bracket_id) REFERENCES users (bracket_id)
);
CREATE TABLE IF NOT EXISTS tourney_organizers(
    user_id INT NOT NULL,
    tourney_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (tourney_id) REFERENCES tourneys (tourney_id)
);

CREATE TABLE IF NOT EXISTS images (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    path TEXT NOT NULL
);

--title TEXT CHECK(title in ('tournament_organizer','player','admin')),--