-- liquibase formatted sql
--changeset <author name>:<0007>


--Index questions
insert into categories (id, name) values (nextval('s_categories'), 'SQL');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which operator is used to create a table?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'NEW TABLE', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'ADD TABLE', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'CREATE TABLE', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'ADD TABLE, PLEASE', currval('s_questions'));


insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which operator is used to modify rows in table?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'UPSERT', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'ALTER', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'MODIFY', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'UPDATE', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which operator is used to delete rows from table?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'DELETE', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'DROP', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'TRUNCATE', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'REMOVE', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which clause is used to limit number of rows returned?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'ROWNUM', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'LIMIT', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'TOP', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'ONLY', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which clause is used to skip first N rows?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'NEXT', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'SKIP', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'OFFSET', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'PASS', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which clause is used to insert a new row into table?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'ADD', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'CREATE', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'NEW', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'INSERT', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'The semicolon at the and of statement is optional?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Yes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'No', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Only in psql, where it forces query to execute', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Yes, but can be redefined', currval('s_questions'));



commit;