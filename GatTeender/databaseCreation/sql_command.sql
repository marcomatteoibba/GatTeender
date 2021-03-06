--DB: gato ; user: gato ; pass: gato ;

CREATE TABLE postType (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(32)
);

CREATE TABLE gatti (
    id  INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(256) UNIQUE,
    razza VARCHAR(256),
    password VARCHAR(256) NOT NULL,
    urlFotoProfilo VARCHAR(256)
);

CREATE TABLE posts (
    id  INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    content VARCHAR(1024),
    type INTEGER,
    FOREIGN KEY (type) REFERENCES postType(id),
    author INTEGER,
    FOREIGN KEY (author) REFERENCES gatti(id)
);

CREATE TABLE hearts (
   follower INTEGER,
   FOREIGN KEY (follower) REFERENCES gatti(id),
   followed INTEGER,
   FOREIGN KEY (followed) REFERENCES gatti(id),
   PRIMARY KEY (follower, followed)
);

--Modifica tabella gatti. Aggiunta colonna email.
ALTER TABLE gatti ADD email VARCHAR(256);

--Popolamento tabella gatti
INSERT INTO gatti (id, name, email, razza, password, urlfotoprofilo)
VALUES (default,
        'Djanni',
        'djannigatto@gmail.com',
        'Incrocio',
        '123',
        'img/djanniprofilo.jpg');

INSERT INTO gatti (id, name, email, razza, password, urlfotoprofilo)
VALUES (default,
        'HeavyBreathing',
        'cholansia@gmail.com',
        'British Shorthair',
        '123',
        'img/user1.gif');

INSERT INTO gatti (id, name, email, razza, password, urlfotoprofilo)
VALUES (default,
        'GymWorkOut',
        'doIt@gmail.com',
        'Gatto Sacro di Birmania',
        '123',
        'img/user2.jpg');

INSERT INTO gatti (id, name, email, razza, password, urlfotoprofilo)
VALUES (default,
        'ChaoPovery',
        'r1tchb1tch@gmail.com',
        'Ocicat',
        '123',
        'img/user3.jpg');

--Popolamento tabella PostType
INSERT INTO posttype (id, name)
VALUES (default, 'TEXT');

INSERT INTO posttype (id, name)
VALUES (default, 'IMAGE');

--Popolamento tabella Post
INSERT INTO posts (id, content, type, author)
VALUES (default,
        'Ciao, miei schiavi. Datemi cibo! Adesso! Miaomiaomiaomiaomiao!',
        1,
        1);

INSERT INTO posts (id, content, type, author)
VALUES (default,
        'img/djanni1.jpg',
        2,
        1);

INSERT INTO posts (id, content, type, author)
VALUES (default,
        'img/djanni2.jpg',
        2,
        1);

INSERT INTO posts (id, content, type, author)
VALUES (default,
        'I need ansioliticy',
        1,
        2);

INSERT INTO posts (id, content, type, author)
VALUES (default,
        'https://68.media.tumblr.com/51942e1f788f7209ee0f6db7cfc5e0fb/tumblr_n37ycpbMZf1rkxod7o1_500.jpg',
        2,
        2);

--Popolamento tabella Hearts (relativa alle amicizie)
INSERT INTO hearts (follower, followed)
VALUES (1, 2),
       (1, 3),
       (1, 4),
       (2, 1),
       (2, 4);

INSERT INTO hearts (follower, followed)
VALUES (3, 1),
       (3, 2);

INSERT INTO hearts (follower, followed)
VALUES (4, 2);

/*
--Query di selezione e visualizzazione dati
--getGattoById(2)
SELECT *
FROM gatti
WHERE id = 2;

--getIdByUserAndPassword('Djanni', '123')
SELECT id
FROM gatti
WHERE name = 'Djanni' AND
      password = '123';

--getPostById(2)
SELECT *
FROM posts
WHERE id = 2;

--getPostList(1)
SELECT *
FROM posts
WHERE author = 1;
*/
