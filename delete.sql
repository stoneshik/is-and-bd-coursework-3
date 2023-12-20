DROP TABLE IF EXISTS
    -- Удаление таблиц ассоциативных сущностей
    role_authorities,
    user_roles,
    function_variants,
    scan_task_files,
    print_task_files,
    machine_files,
    -- Осталььные сущности
    scan_tasks,
    print_tasks,
    machine_supplies,
    machine_conditions,
    machines,
    vending_point_schedules,
    vending_point_unusual_schedules,
    vending_points,
    orders,
    replenishes,
    accounts,
    files,
    users,
    roles,
    authorities
    ;
DROP TYPE IF EXISTS
    user_status_enum,
    day_week_enum,
    function_variant_enum,
    machine_status_enum,
    order_type_enum,
    order_status_enum,
    print_task_color_enum
    ;