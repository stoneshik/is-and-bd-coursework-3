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
    (2,
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
    (2, 2, 0),
    (3, 2, 2)
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
INSERT INTO vending_points(
    vending_point_id,
    vending_point_address,
    vending_point_description,
    vending_point_number_machines,
    vending_point_cords)
VALUES
    (0,
     'Невский пр-кт, 2',
     'Находится рядом с банкоматом',
     2,
     point(59.93716299256363, 30.313378213455664)),
    (1,
     'Комендансткий пр-кт, 34',
     'Находится в подвале рядом с шаурмечной',
     1,
     point(60.02097852901829, 30.242859111340625))
    ;
INSERT INTO vending_point_schedules(
    vending_point_schedule_id,
    vending_point_id,
    vending_point_schedule_day_week,
    vending_point_schedule_time_start,
    vending_point_schedule_time_end)
VALUES
    (0, 0, 'monday', '10:00', '20:00'),
    (1, 0, 'tuesday', '09:00', '21:00'),
    (2, 0, 'wednesday', '11:00', '23:00'),
    (3, 0, 'thursday', '10:00', '20:00'),
    (4, 0, 'friday', '10:00', '20:00'),
    (5, 1, 'saturday', '06:35', '22:20'),
    (6, 1, 'sunday', '09:03', '21:55')
    ;
INSERT INTO vending_point_unusual_schedules(
    vending_point_unusual_schedule_id,
    vending_point_id,
    vending_point_unusual_schedule_date,
    vending_point_schedule_time_start,
    vending_point_schedule_time_end)
VALUES
    (0, 0, '15.11.2024', '02:00', '22:00')
    ;
-- Вендинговые аппараты (машины)
INSERT INTO machines(machine_id, vending_point_id)
VALUES
    (0, 0),
    (1, 0),
    (2, 1)
    ;
INSERT INTO function_variants(function_variant_id, vending_point_id, machine_id, function_variant)
VALUES
    (0, 0, 0, 'black_white_print'),
    (1, 0, 0, 'color_print'),
    (2, 0, 1, 'black_white_print'),
    (3, 0, 1, 'color_print'),
    (4, 0, 1, 'scan'),
    (5, 1, 2, 'black_white_print'),
    (6, 1, 2, 'scan')
    ;
INSERT INTO machine_supplies(
    machine_supplies_id,
    machine_id,
    machine_supplies_quantity_paper,
    machine_supplies_ink_level,
    machine_supplies_datetime)
VALUES
    (0, 0, 100, 900, default),
    (1, 0, 40, 800, default),
    (2, 1, 200, 500, default),
    (3, 2, 800, 1000, default)
    ;
INSERT INTO machine_conditions(machine_condition_id, machine_id, machine_status, machine_condition_datetime)
VALUES
    (0, 0, 'work', default),
    (1, 0, 'temporarily_not_work', default),
    (2, 0, 'work', default),
    (3, 1, 'work', default),
    (4, 2, 'temporarily_not_work', default)
    ;
-- Заказы/задания
INSERT INTO orders(
    order_id,
    account_id,
    vending_point_id,
    order_amount,
    order_datetime,
    order_type,
    order_status,
    order_num)
VALUES
    (0, 0, 0, 15, default, 'print', 'paid', 112345),
    (1, 0, 0, 5, default, 'scan', 'completed', 332318),
    (2, 2, 1, 30, default, 'print', 'completed', 123456)
    ;
INSERT INTO scan_tasks(scan_task_id, order_id, machine_id, scan_task_number_pages)
VALUES
    (0, 1, 1, 10)
    ;
INSERT INTO print_tasks(
    print_task_id,
    order_id,
    machine_id,
    print_task_color,
    print_task_is_entire_document,
    print_task_selected_pages,
    print_task_number_copies)
VALUES
    (0, 0, 0, 'color', false, '{true, false, true, true}', 1),
    (1, 2, 2, 'black_white', true, NULL, 1),
    (2, 2, 2, 'black_white', true, NULL, 1)
    ;
INSERT INTO files(file_id, user_id, file_name, file_number_pages, file_load_datetime, file_oid)
VALUES
    (0, 0, 'first.pdf', 3, default, lo_import('/home/bd/first.pdf')),
    (1, 2, 'second_order1.pdf', 4, default, lo_import('/home/bd/second_order1.pdf')),
    (2, 2, 'second_order2.pdf', 2, default, lo_import('/home/bd/second_order2.pdf')),
    (3, 1, 'scan.pdf', 10, default, lo_import('/home/bd/scan.pdf'))
    ;
INSERT INTO scan_task_files(scan_task_file_id, scan_task_id, file_id)
VALUES
    (0, 0, 3)
    ;
INSERT INTO print_task_files(print_task_file_id, print_task_id, file_id)
VALUES
    (0, 0, 0),
    (1, 1, 1),
    (2, 2, 2)
    ;
INSERT INTO machine_files(machine_file_id, machine_id, file_id)
VALUES
    (0, 0, 0),
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 3)
    ;