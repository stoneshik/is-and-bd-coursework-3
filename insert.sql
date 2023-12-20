-- Авторизация/регистрация
INSERT INTO roles(role_id, role_name, role_description, role_created_datetime)
VALUES
    (0, 'user', 'Базовая роль, для обычного пользователя', default),
    (1, 'moder', 'Роль модератора, работника сервиса, почти не имеет ограничений', default),
    (2, 'admin', 'Роль администратора, владельца сервиса, не имеет ограничений', default)
    ;
INSERT INTO users(
    user_id,
    user_email,
    user_login,
    user_password_hash,
    user_first_name,
    user_second_name,
    user_birthday_date,
    user_created_datetime,
    user_status)
VALUES
    (0,
     'aboba@mail.ru',
     'aboba',
     '$2a$12$7ktmzZIdD5j1PJ9eAWQKEemXyYknFko/VrrROIofgQkpBhBRp5vvy',
     'Игорь',
     'Иванов',
     '01.09.2000',
     default,
     'unverified'),
    (1,
     'sus@yandex.ru',
     'sus',
     '$2a$12$LBg9XtoUGZrIx1gr1pp4IOmxzDjl/t8CO1WVvzJRt1oya20zBr38C',
     'Иван',
     'Кузнецов',
     '18.03.1998',
     default,
     'unverified'),
    (3,
     'baka@gmail.com',
     'baka',
     '$2a$12$6oDRrrEb1uiON72tjBBfoeJvEeSEV7rJM3ik24s22Ssl44avEB5ZK',
     'Макс',
     'Соколов',
     '21.05.2003',
     default,
     'verified')
    ;
INSERT INTO user_roles(user_role_id, user_id, role_id)
VALUES
    (0, 0, 0),
    (1, 1, 0),
    (2, 2, 2)
    ;
-- Счет
INSERT INTO accounts(account_id, user_id, account_balance)
VALUES
    (0, 0, 10),
    (1, 1, 20),
    (2, 2, 100)
    ;
INSERT INTO replenishes(replenish_id, account_id, replenish_amount, replenish_datetime)
VALUES
    (0, 0, 20, default),
    (1, 1, 20, default),
    (2, 2, 30, default),
    (3, 0, 10, default),
    (4, 2, 70, default)
    ;
-- Вендинговые точки
