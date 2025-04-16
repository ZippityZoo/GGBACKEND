INSERT INTO users (user_id, first_name, last_name, email, tag, password, standing) 
VALUES (1,'John', 'Doe', 'john.doe@example.com', 'genog', '12345',0.0);

INSERT INTO users (user_id,first_name, last_name, email, tag, password, standing) 
VALUES (2,'Jane', 'Doe', 'jane.doe@example.com', 'genog2', '12345',0.0);

INSERT INTO users (user_id,first_name, last_name, email, tag, password, standing) 
VALUES (4,'David', 'Dumile', 'villan@example.com', 'MetalFace', '12345',0.0);

INSERT INTO users (user_id,first_name, last_name, email, tag, password, standing) 
VALUES (5,'89', 'P13', 'notaracoon@example.com', 'Rocket', '12345',0.0);

INSERT INTO users (user_id,first_name, last_name, email, tag, password) 
VALUES (3,'HE', 'HIM', 'to@example.com', 'RESPECTYOURELDERS', '12345');

INSERT INTO tourneys (tourney_id, name, address, start_date, end_date)
VALUES (1,'Baby`s First Tourney','1365 The Crib',CURRENT_DATE, CURRENT_DATE);

INSERT INTO brackets(bracket_id,tourney_id,type,game_name,start_time,end_sign_up_time,date_created)
VALUES (1,1,'single_elimination','Smash',CURRENT_DATE,CURRENT_DATE,CURRENT_DATE);

INSERT INTO brackets(bracket_id,tourney_id,type,game_name,start_time,end_sign_up_time,date_created)
VALUES (2,1,'double_elimination','Rivals of Aether',CURRENT_DATE,CURRENT_DATE,CURRENT_DATE);

INSERT INTO brackets(bracket_id,tourney_id,type,game_name,start_time,end_sign_up_time,date_created)
VALUES (3,1,'double_elimination','TEKKEN',CURRENT_DATE,CURRENT_DATE,CURRENT_DATE);

INSERT INTO tourney_organizers (user_id, tourney_id) 
VALUES (3,1);
--john doe
INSERT INTO user_brackets (user_id, bracket_id, date_signed_up) 
VALUES (1,1,CURRENT_DATE);

INSERT INTO user_brackets (user_id, bracket_id, date_signed_up) 
VALUES (1,2,CURRENT_DATE);

INSERT INTO user_brackets (user_id, bracket_id, date_signed_up) 
VALUES (1,3,CURRENT_DATE);

--jane doe
INSERT INTO user_brackets (user_id, bracket_id, date_signed_up) 
VALUES (2,2,CURRENT_DATE);

INSERT INTO user_brackets (user_id, bracket_id, date_signed_up) 
VALUES (2,3,CURRENT_DATE);
--doom
INSERT INTO user_brackets (user_id, bracket_id, date_signed_up) 
VALUES (4,1,CURRENT_DATE);
--rocket
INSERT INTO user_brackets (user_id, bracket_id, date_signed_up) 
VALUES (5,1,CURRENT_DATE);

INSERT INTO user_brackets (user_id, bracket_id, date_signed_up) 
VALUES (5,3,CURRENT_DATE);

--insert these
--
INSERT INTO tourneys (tourney_id, name, address, start_date, end_date)
VALUES (2,'Fireball','HELL',CURRENT_DATE, CURRENT_DATE);

INSERT INTO brackets(tourney_id,type,game_name,start_time,end_sign_up_time,date_created)
VALUES (2,'double_elimination','SF6',CURRENT_DATE,CURRENT_DATE,CURRENT_DATE);

INSERT INTO brackets(tourney_id,type,game_name,start_time,end_sign_up_time,date_created)
VALUES (2,'double_elimination','TEKKEN',CURRENT_DATE,CURRENT_DATE,CURRENT_DATE);
--
INSERT INTO tourneys (tourney_id, name, address, start_date, end_date)
VALUES (3,'Mom`s Basement','Your Mom`s House',CURRENT_DATE, CURRENT_DATE);

INSERT INTO brackets(tourney_id,type,game_name,start_time,end_sign_up_time,date_created)
VALUES (3,'double_elimination','Smash',CURRENT_DATE,CURRENT_DATE,CURRENT_DATE);
--
INSERT INTO tourneys (tourney_id, name, address, start_date, end_date)
VALUES (4,'Bottom Fighters','The Lake,The Lake',CURRENT_DATE, CURRENT_DATE);

INSERT INTO brackets(tourney_id,type,game_name,start_time,end_sign_up_time,date_created)
VALUES (4,'single_elimination','KOF',CURRENT_DATE,CURRENT_DATE,CURRENT_DATE);

INSERT INTO brackets(tourney_id,type,game_name,start_time,end_sign_up_time,date_created)
VALUES (4,'single_elimination','GranBlue',CURRENT_DATE,CURRENT_DATE,CURRENT_DATE);