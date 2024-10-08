create database lab1;
create table users (
    id serial primary key,
    firstname varchar(50),
    lastname varchar(50),
    data_joined date
);
alter table users add column isadmin integer;
alter table users alter column isadmin type boolean;
alter table users alter column isadmin set default false;
create table tasks(
    id serial primary key,
    name varchar(50),
    user_id integer references users(id)
);
drop table tasks;
drop database lab1;
