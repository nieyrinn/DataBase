create database lab2;

create table countries (
                           country_id serial primary key,
                           country_name varchar(256),
                           region_id int,
                           population int
);

insert into countries (country_name, region_id, population) values ('Kazakhstan', 1, 18500000);

insert into countries (country_id, country_name) values (2, 'Japan');

insert into countries (region_id) values (NULL);

insert into countries (country_name, region_id, population) values ('Italy', 2, 13934458), ('Korea', 3, 4934981), ('Germany', 4, 59866494);

alter table countries alter column country_name set default 'Kazakhstan';

insert into countries (region_id, population) VALUES (5, 4000000);

insert into countries default values;

create table countries_new (like countries including all);

insert into countries_new select * from countries;

update countries set region_id = 1 where region_id is null;

select country_name, population * 1.10 as "New Population" from countries;

delete from countries where population < 100000;

delete from countries_new where country_id in (select country_id from countries) returning *;

delete * countries returning *;



select * from countries where population > 100000;
