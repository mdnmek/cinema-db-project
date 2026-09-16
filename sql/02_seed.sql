INSERT INTO genres (name) VALUES 
('Комедия'), ('Фантастика'), ('Драма'), ('Боевик'), 
('Ужасы'), ('Триллер'), ('Мелодрама'), ('Детектив'),
('Приключения'), ('Анимация'), ('Документальный'), ('Криминал');

INSERT INTO actors (first_name, last_name) VALUES 
('Киану', 'Ривз'), 
('Том', 'Хэнкс'), 
('Леонардо', 'ДиКаприо'),
('Скарлетт', 'Йоханссон'), 
('Брэд', 'Питт'), 
('Анджелина', 'Джоли'),
('Роберт', 'Дауни-мл.'), 
('Крис', 'Эванс'), 
('Морган', 'Фриман'),
('Мэтт', 'Дэймон'), 
('Дженнифер', 'Лоуренс'), 
('Дуэйн', 'Джонсон'),
('Джонни', 'Депп'), 
('Натали', 'Портман'), 
('Кристиан', 'Бэйл'), 
('Рассел', 'Кроу'),
('Рэйф', 'Файнс'),
('Сэм', 'Уортингтон'),
('Райан', 'Гослинг'), 
('Сэмюэл', 'Джексон'),    
('Сандра', 'Буллок'),         
('Франсуа', 'Клюзе'),         
('Мэттью', 'Бродерик'),       
('Дэниэл', 'Крэйг');

INSERT INTO movies (title, release_year, duration_minutes, age_rating, description) VALUES 
('Матрица', 1999, 136, '16+', 'Хакер узнает, что реальность — это симуляция.'),
('Форрест Гамп', 1994, 142, '12+', 'История простого человека с добрым сердцем.'),
('Начало', 2010, 148, '16+', 'Вор проникает в сны, чтобы украсть идеи.'),
('Мстители', 2012, 143, '12+', 'Команда супергероев спасает мир.'),
('Титаник', 1997, 194, '12+', 'Трагическая история любви на тонущем корабле.'),
('Бойцовский клуб', 1999, 139, '18+', 'Офисный работник создает подпольный клуб.'),
('Интерстеллар', 2014, 169, '12+', 'Путешествие сквозь червоточину для спасения человечества.'),
('Побег из Шоушенка', 1994, 142, '16+', 'История несправедливо осужденного банкира.'),
('Криминальное чтиво', 1994, 154, '18+', 'Несколько пересекающихся криминальных историй.'),
('Гладиатор', 2000, 155, '16+', 'Римский генерал становится гладиатором.'),
('Отель Гранд Будапешт', 2014, 99, '16+', 'Приключения консьержа в вымышленном отеле.'),
('Джанго освобожденный', 2012, 165, '18+', 'Освобожденный раб мстит за свою семью.'),
('Черный лебедь', 2010, 108, '18+', 'Балерина погружается в безумие.'),
('Отступники', 2006, 151, '18+', 'Крот в полиции и коп в мафии.'),
('Аватар', 2009, 162, '12+', 'Парализованный морпех на планете Пандора.'),
('Марсианин', 2015, 144, '16+', 'Астронавт выживает на Марсе в одиночку.'),
('Ла-Ла Ленд', 2016, 128, '12+', 'Современный мюзикл о любви и мечтах.'),
('Омерзительная восьмерка', 2015, 187, '18+', 'Опасные незнакомцы в заснеженном домике.'),
('Волк с Уолл-стрит', 2013, 180, '18+', 'Взлет и падение биржевого брокера.'),
('Гравитация', 2013, 91, '12+', 'Астронавты пытаются выжить после аварии в космосе.'),
('1+1', 2011, 112, '16+', 'История дружбы парализованного аристократа и его помощника.'),
('Зеленая миля', 1999, 189, '16+', 'История тюремного надзирателя и заключенного с даром.'),
('Король Лев', 1994, 88, '6+', 'Львенок Симба борется за свое место в прайде.'),
('Темный рыцарь', 2008, 152, '12+', 'Бэтмен противостоит Джокеру.'),
('Достать ножи', 2019, 130, '16+', 'Детектив расследует смерть патриарха богатой семьи.');

INSERT INTO users (username, email, password_hash)
SELECT 
    'user_' || i,
    'user' || i || '@example.com',
    md5(random()::text)
FROM generate_series(1, 100) AS i;

INSERT INTO movie_genres (movie_id, genre_id)
SELECT m.movie_id, g.genre_id
FROM movies m, genres g
WHERE 
    (m.title = 'Матрица' AND g.name IN ('Фантастика', 'Боевик'))
    OR (m.title = 'Форрест Гамп' AND g.name IN ('Драма', 'Мелодрама', 'Комедия'))
    OR (m.title = 'Начало' AND g.name IN ('Фантастика', 'Боевик', 'Триллер', 'Драма', 'Детектив'))
    OR (m.title = 'Мстители' AND g.name IN ('Фантастика', 'Боевик', 'Приключения'))
    OR (m.title = 'Титаник' AND g.name IN ('Драма', 'Мелодрама', 'Приключения'))
    OR (m.title = 'Бойцовский клуб' AND g.name IN ('Триллер', 'Драма', 'Криминал'))
    OR (m.title = 'Интерстеллар' AND g.name IN ('Фантастика', 'Драма', 'Приключения'))
    OR (m.title = 'Побег из Шоушенка' AND g.name IN ('Драма', 'Криминал'))
    OR (m.title = 'Криминальное чтиво' AND g.name IN ('Триллер', 'Криминал', 'Комедия'))
    OR (m.title = 'Гладиатор' AND g.name IN ('Боевик', 'Драма', 'Приключения'))
    OR (m.title = 'Отель Гранд Будапешт' AND g.name IN ('Комедия', 'Драма', 'Приключения', 'Криминал'))
    OR (m.title = 'Джанго освобожденный' AND g.name IN ('Драма', 'Криминал', 'Комедия'))
    OR (m.title = 'Черный лебедь' AND g.name IN ('Триллер', 'Драма'))
    OR (m.title = 'Отступники' AND g.name IN ('Триллер', 'Драма', 'Криминал', 'Детектив'))
    OR (m.title = 'Аватар' AND g.name IN ('Фантастика', 'Боевик', 'Приключения'))
    OR (m.title = 'Марсианин' AND g.name IN ('Фантастика', 'Приключения'))
    OR (m.title = 'Ла-Ла Ленд' AND g.name IN ('Мелодрама', 'Драма', 'Комедия'))
    OR (m.title = 'Омерзительная восьмерка' AND g.name IN ('Триллер', 'Драма', 'Детектив'))
    OR (m.title = 'Волк с Уолл-стрит' AND g.name IN ('Драма', 'Комедия', 'Криминал'))
    OR (m.title = 'Гравитация' AND g.name IN ('Фантастика', 'Триллер', 'Драма'))
    OR (m.title = '1+1' AND g.name IN ('Драма', 'Комедия'))
    OR (m.title = 'Зеленая миля' AND g.name IN ('Драма', 'Криминал', 'Детектив'))
    OR (m.title = 'Король Лев' AND g.name IN ('Анимация', 'Драма', 'Приключения'))
    OR (m.title = 'Темный рыцарь' AND g.name IN ('Боевик', 'Триллер', 'Криминал', 'Драма'))
    OR (m.title = 'Достать ножи' AND g.name IN ('Детектив', 'Драма', 'Комедия', 'Криминал'));


INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Нео' FROM movies m, actors a WHERE m.title = 'Матрица' AND a.last_name = 'Ривз';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Форрест Гамп' FROM movies m, actors a WHERE m.title = 'Форрест Гамп' AND a.last_name = 'Хэнкс';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Дом Cobb' FROM movies m, actors a WHERE m.title = 'Начало' AND a.last_name = 'ДиКаприо';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Тони Старк' FROM movies m, actors a WHERE m.title = 'Мстители' AND a.last_name = 'Дауни-мл.';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Джек Доусон' FROM movies m, actors a WHERE m.title = 'Титаник' AND a.last_name = 'ДиКаприо';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Тайлер Дёрден' FROM movies m, actors a WHERE m.title = 'Бойцовский клуб' AND a.last_name = 'Питт';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Купер' FROM movies m, actors a WHERE m.title = 'Интерстеллар' AND a.last_name = 'Дэймон';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Энди Дюфрейн' FROM movies m, actors a WHERE m.title = 'Побег из Шоушенка' AND a.last_name = 'Фриман';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Винсент Вега' FROM movies m, actors a WHERE m.title = 'Криминальное чтиво' AND a.last_name = 'Питт';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Максимус' FROM movies m, actors a WHERE m.title = 'Гладиатор' AND a.last_name = 'Кроу';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Месье Густав' FROM movies m, actors a WHERE m.title = 'Отель Гранд Будапешт' AND a.last_name = 'Файнс';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Джанго' FROM movies m, actors a WHERE m.title = 'Джанго освобожденный' AND a.last_name = 'ДиКаприо';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Нина Сейерс' FROM movies m, actors a WHERE m.title = 'Черный лебедь' AND a.last_name = 'Портман';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Колин Салливан' FROM movies m, actors a WHERE m.title = 'Отступники' AND a.last_name = 'Дэймон';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Джейк Салли' FROM movies m, actors a WHERE m.title = 'Аватар' AND a.last_name = 'Уортингтон';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Марк Уотни' FROM movies m, actors a WHERE m.title = 'Марсианин' AND a.last_name = 'Дэймон';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Себастьян' FROM movies m, actors a WHERE m.title = 'Ла-Ла Ленд' AND a.last_name = 'Гослинг';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Джон Рут' FROM movies m, actors a WHERE m.title = 'Омерзительная восьмерка' AND a.last_name = 'Джексон';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Джордан Белфорт' FROM movies m, actors a WHERE m.title = 'Волк с Уолл-стрит' AND a.last_name = 'ДиКаприо';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Райан Стоун' FROM movies m, actors a WHERE m.title = 'Гравитация' AND a.last_name = 'Буллок';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Филипп' FROM movies m, actors a WHERE m.title = '1+1' AND a.last_name = 'Клюзе';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Пол Эджкомб' FROM movies m, actors a WHERE m.title = 'Зеленая миля' AND a.last_name = 'Хэнкс';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Симба (голос)' FROM movies m, actors a WHERE m.title = 'Король Лев' AND a.last_name = 'Бродерик';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Брюс Уэйн' FROM movies m, actors a WHERE m.title = 'Темный рыцарь' AND a.last_name = 'Бэйл';

INSERT INTO movie_actors (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Бенуа Бланк' FROM movies m, actors a WHERE m.title = 'Достать ножи' AND a.last_name = 'Крэйг';


INSERT INTO reviews (user_id, movie_id, rating, comment, review_date)
SELECT 
    floor(random() * (SELECT MAX(user_id) FROM users) + 1)::int AS user_id,
    floor(random() * (SELECT MAX(movie_id) FROM movies) + 1)::int AS movie_id,
    floor(random() * 10 + 1)::int AS rating,
    CASE floor(random() * 3)
        WHEN 0 THEN 'Отличный фильм, всем советую!'
        WHEN 1 THEN 'Неплохо, но могло быть лучше.'
        ELSE 'Не впечатлило, ожидал большего.'
    END AS comment,
    CURRENT_TIMESTAMP - (random() * 365)::int * INTERVAL '1 day' AS review_date
FROM generate_series(1, 1000);