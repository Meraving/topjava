DELETE FROM user_roles;
DELETE FROM meals;
DELETE FROM users;
ALTER SEQUENCE global_seq RESTART WITH 100000;

INSERT INTO users (name, email, password) VALUES
  ('User', 'user@yandex.ru', 'password'),
  ('Admin', 'admin@gmail.com', 'admin');

INSERT INTO user_roles (role, user_id) VALUES
  ('ROLE_USER', 100000),
  ('ROLE_ADMIN', 100001);

INSERT INTO meals ( user_id, datetime, description, calories) VALUES
(100000,'2020-01-01 19:10:25','радостный жор новогодних салатов',10000),
(100000,'2020-01-02 12:08:34','радостный жор новогодних салатов',4000),
(100000,'2020-01-03 14:53:16','радостный жор новогодних салатов',1000)
;
