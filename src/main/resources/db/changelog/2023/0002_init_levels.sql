-- liquibase formatted sql
--changeset <author name>:<0002>

insert into levels (id, name) values (1, 'Junior');
insert into levels (id, name) values (2, 'Middle');
insert into levels (id, name) values (3, 'Senior');
commit;