-- liquibase formatted sql
--changeset <author name>:<0007>


--Index questions
insert into categories (id, name) values (nextval('s_categories'), 'pg_catalog');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which table keep all schemas?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_namespace', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_schemas', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_tablespaces', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_users', currval('s_questions'));




commit;