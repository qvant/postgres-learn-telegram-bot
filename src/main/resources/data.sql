insert into levels (id, name) values (1, 'Junior');
insert into levels (id, name) values (2, 'Middle');
insert into levels (id, name) values (3, 'Senior');

--psql questions
insert into categories (id, name) values (nextval('s_categories'), 'psql');
insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to list data types?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'du', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dt', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dT', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dp', currval('s_questions'));
insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to list roles?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'du', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dt', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dT', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dp', currval('s_questions'));
insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to list tables, views and sequences?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'du', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dt', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dT', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dp', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to print something into standard output?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'print', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'output', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'echo', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'debug', currval('s_questions'));
insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to show or set client encoding?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'cp', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'encoding', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'chcp', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'lang', currval('s_questions'));

--data types questions
insert into categories (id, name) values (nextval('s_categories'), 'data types');
insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What is difference between serial and int4?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Serial also create sequence for the column in question, used as the default value', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Serial enforces unique constraint on the column', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Serial is equivalent of int8', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Serial and int4 are the same datatype', currval('s_questions'));
commit;