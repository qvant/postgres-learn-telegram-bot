-- liquibase formatted sql
--changeset <author name>:<0009>


--Index questions
insert into categories (id, name) values (nextval('s_categories'), 'Setup and config');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How many databases created when cluster initialized?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '1', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '2', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '3', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '4', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which databases are created when cluster initialized?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'postgres', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'postgres, template0', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'postgres, template0, template1', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'postgres, template0, template1, template2', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which databases are created when cluster initialized?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'postgres', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'postgres, root', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'postgres, template0', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'postgres, template0, template1', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');


insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What are the propose of database postgres?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Just for external utility that assume it exists', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Keep cluster metadata', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Keep compatibility with old versions', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''used in replication', currval('s_questions'));






commit;