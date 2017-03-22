DELETE FROM user_roles;
DELETE FROM users;
DELETE FROM meals;

ALTER SEQUENCE global_seq RESTART WITH 100000;

INSERT INTO users (name, email, password)
VALUES ('User', 'user@yandex.ru', 'password');

INSERT INTO users (name, email, password)
VALUES ('Admin', 'admin@gmail.com', 'admin');

INSERT INTO user_roles (role, user_id) VALUES
  ('ROLE_USER', 100000),
  ('ROLE_ADMIN', 100001);

INSERT INTO meals (description, calories, date, user_id) VALUES
  ('Завтрак', 500, '2017-03-21 09:00:00', 100000),
  ('Обед', 1200, '2017-03-21 14:30:00', 100000),
  ('Ужин', 500, '2017-03-21 20:15:00', 100000),
  ('Завтрак админ', 600, '2017-03-21 10:20:00', 100001),
  ('Обед админ', 700, '2017-03-21 13:00:00', 100001),
  ('Ужин админ', 800, '2017-03-21 20:00:00', 100001),
  ('Завтрак', 500, '2017-03-22 10:00:00', 100000),
  ('Обед', 1000, '2017-03-22 13:00:00', 100000),
  ('Ужин', 500, '2017-03-22 19:00:00', 100000),
  ('Завтрак админ', 500, '2017-03-22 10:00:00', 100001),
  ('Обед админ', 800, '2017-03-22 14:00:00', 100001),
  ('Ужин админ', 400, '2017-03-22 19:30:00', 100001);
