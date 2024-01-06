-- liquibase formatted sql
--changeset <author name>:<0001>

update answers set text = 'Optional everywhere except psql, where it forces query to execute' where text = 'Only in psql, where it forces query to execute';
commit;