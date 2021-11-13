
    create table customer (
       id bigint not null,
        name nvarchar(255),
        notes nvarchar(255),
        phone_number varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table customer_pet_ids (
       customer_id bigint not null,
        pet_ids_id bigint not null
    ) engine=InnoDB

    create table employee (
       id bigint not null,
        name nvarchar(255),
        primary key (id)
    ) engine=InnoDB

    create table employee_days_available (
       employee_id bigint not null,
        days_available integer
    ) engine=InnoDB

    create table employee_skills (
       employee_id bigint not null,
        skills integer
    ) engine=InnoDB

    create table hibernate_sequence (
       next_val bigint
    ) engine=InnoDB

    insert into hibernate_sequence values ( 1 )

    insert into hibernate_sequence values ( 1 )

    insert into hibernate_sequence values ( 1 )

    insert into hibernate_sequence values ( 1 )

    create table pet (
       id bigint not null,
        birth_date date,
        name nvarchar(255),
        notes nvarchar(255),
        type varchar(255),
        customer_id bigint not null,
        primary key (id)
    ) engine=InnoDB

    create table schedule (
       id bigint not null,
        date date,
        primary key (id)
    ) engine=InnoDB

    create table schedule_activities (
       schedule_id bigint not null,
        activities integer
    ) engine=InnoDB

    create table schedule_employee_ids (
       schedule_id bigint not null,
        employee_ids_id bigint not null
    ) engine=InnoDB

    create table schedule_pet_ids (
       schedule_id bigint not null,
        pet_ids_id bigint not null
    ) engine=InnoDB

    alter table customer_pet_ids 
       add constraint UK_1s86mtp9kg3faljuwr84gdvrd unique (pet_ids_id)

    alter table customer_pet_ids 
       add constraint FK98klcoi42kvjeub2hi2kyp36j 
       foreign key (pet_ids_id) 
       references pet (id)

    alter table customer_pet_ids 
       add constraint FK7tniq4xolqlrmpy2s7aj2n8k7 
       foreign key (customer_id) 
       references customer (id)

    alter table employee_days_available 
       add constraint FK7ra3ha8r7rcikm5k4ow91hluk 
       foreign key (employee_id) 
       references employee (id)

    alter table employee_skills 
       add constraint FKnepe51hewn4dd673e3qk1v2qx 
       foreign key (employee_id) 
       references employee (id)

    alter table pet 
       add constraint FKt742r2fu4c3i9sn6a8kv0k746 
       foreign key (customer_id) 
       references customer (id)

    alter table schedule_activities 
       add constraint FKp4gtwmuodj21fo9kjww5ql477 
       foreign key (schedule_id) 
       references schedule (id)

    alter table schedule_employee_ids 
       add constraint FKo7r5k3wlyeu28npvxlvh2c0yp 
       foreign key (employee_ids_id) 
       references employee (id)

    alter table schedule_employee_ids 
       add constraint FKkb49i2ardhwgjvbiurm7sv06n 
       foreign key (schedule_id) 
       references schedule (id)

    alter table schedule_pet_ids 
       add constraint FKehav8b36dtl2uq6g45yf8qppl 
       foreign key (pet_ids_id) 
       references pet (id)

    alter table schedule_pet_ids 
       add constraint FKlyd6ijxoe9igbceaek83uoupp 
       foreign key (schedule_id) 
       references schedule (id)

    create table customer (
       id bigint not null,
        name nvarchar(255),
        notes nvarchar(255),
        phone_number varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table customer_pet_ids (
       customer_id bigint not null,
        pet_ids_id bigint not null
    ) engine=InnoDB

    create table employee (
       id bigint not null,
        name nvarchar(255),
        primary key (id)
    ) engine=InnoDB

    create table employee_days_available (
       employee_id bigint not null,
        days_available integer
    ) engine=InnoDB

    create table employee_skills (
       employee_id bigint not null,
        skills integer
    ) engine=InnoDB

    create table hibernate_sequence (
       next_val bigint
    ) engine=InnoDB

    insert into hibernate_sequence values ( 1 )

    insert into hibernate_sequence values ( 1 )

    insert into hibernate_sequence values ( 1 )

    insert into hibernate_sequence values ( 1 )

    create table pet (
       id bigint not null,
        birth_date date,
        name nvarchar(255),
        notes nvarchar(255),
        type varchar(255),
        customer_id bigint not null,
        primary key (id)
    ) engine=InnoDB

    create table schedule (
       id bigint not null,
        date date,
        primary key (id)
    ) engine=InnoDB

    create table schedule_activities (
       schedule_id bigint not null,
        activities integer
    ) engine=InnoDB

    create table schedule_employee_ids (
       schedule_id bigint not null,
        employee_ids_id bigint not null
    ) engine=InnoDB

    create table schedule_pet_ids (
       schedule_id bigint not null,
        pet_ids_id bigint not null
    ) engine=InnoDB

    alter table customer_pet_ids 
       add constraint UK_1s86mtp9kg3faljuwr84gdvrd unique (pet_ids_id)

    alter table customer_pet_ids 
       add constraint FK98klcoi42kvjeub2hi2kyp36j 
       foreign key (pet_ids_id) 
       references pet (id)

    alter table customer_pet_ids 
       add constraint FK7tniq4xolqlrmpy2s7aj2n8k7 
       foreign key (customer_id) 
       references customer (id)

    alter table employee_days_available 
       add constraint FK7ra3ha8r7rcikm5k4ow91hluk 
       foreign key (employee_id) 
       references employee (id)

    alter table employee_skills 
       add constraint FKnepe51hewn4dd673e3qk1v2qx 
       foreign key (employee_id) 
       references employee (id)

    alter table pet 
       add constraint FKt742r2fu4c3i9sn6a8kv0k746 
       foreign key (customer_id) 
       references customer (id)

    alter table schedule_activities 
       add constraint FKp4gtwmuodj21fo9kjww5ql477 
       foreign key (schedule_id) 
       references schedule (id)

    alter table schedule_employee_ids 
       add constraint FKo7r5k3wlyeu28npvxlvh2c0yp 
       foreign key (employee_ids_id) 
       references employee (id)

    alter table schedule_employee_ids 
       add constraint FKkb49i2ardhwgjvbiurm7sv06n 
       foreign key (schedule_id) 
       references schedule (id)

    alter table schedule_pet_ids 
       add constraint FKehav8b36dtl2uq6g45yf8qppl 
       foreign key (pet_ids_id) 
       references pet (id)

    alter table schedule_pet_ids 
       add constraint FKlyd6ijxoe9igbceaek83uoupp 
       foreign key (schedule_id) 
       references schedule (id)
