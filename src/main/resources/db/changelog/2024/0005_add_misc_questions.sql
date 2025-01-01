-- liquibase formatted sql
--changeset <author name>:<0005>


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'What does full_page_write does?', 3, id
from categories where name = 'Setup and config');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Forces Postgres to save into WAL full data page, during first modification after checkpoint', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Forces Postgres to save into WAL full data page on every change', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Forces Postgres to write data on disc in 8 kb blocks instead of only changed fields', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Forces Postgres to call fsync after saving every page on disc', currval('s_questions'));

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'What are the propose of database template0?', 3, id
from categories where name = 'Setup and config');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'To recovery from logical backup or to create db with different encoding', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Just for external utility that assume it exists', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Keep cluster metadata', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Keep compatibility with old versions', currval('s_questions'));


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'What are the propose of database template1?', 3, id
from categories where name = 'Setup and config');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'To recovery from logical backup or to create db with different encoding', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'To be used as template for the user databases', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Keep cluster metadata', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Keep compatibility with old versions', currval('s_questions'));



commit;