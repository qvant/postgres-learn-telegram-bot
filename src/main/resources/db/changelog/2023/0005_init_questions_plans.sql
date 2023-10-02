-- liquibase formatted sql
--changeset <author name>:<0005>


--Plan questions
insert into categories (id, name) values (nextval('s_categories'), 'plans');
insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the difference between explain and explain analyze?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Explain analyze actually perform query', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Explain analyze gather stats before making plan', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Explain analyze provide better plan', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'They are the same', currval('s_questions'));

commit;