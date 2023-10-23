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
insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Index Scan does?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read the whole index', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Go from the root to the only accepted value, if any', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Go from the root to the first leaf node with accepted value, than walk through leafs until condition is false without following table access', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Go from the root to the first leaf node with accepted value, than walk through leafs until condition is false, than access table pages, based on index info', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Seq Scan does?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Fetch value from sequence', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read the whole table', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Fetch sequence from cache', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read the whole index', currval('s_questions'));
insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What is seq_page_cost?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Amount of time, needed to read row from disc', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Amount of time, needed to save row on disc', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Planner''s estimate of the cost of a disk page fetch that is part of a series of sequential fetches.', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Planner''s estimate of the cost of fetching sequence value', currval('s_questions'));
insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Bitmap Index Scan does?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read the inner structures to access index pages more efficiently', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read in-memory bitmap to combine two indexes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read the leafs of bitmap index', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read the index and build bitmap of potential row locations', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

commit;