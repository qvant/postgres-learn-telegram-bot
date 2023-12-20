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

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What is seq_page_cost?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Amount of time, needed to read row from disc', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Amount of time, needed to save row on disc', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Planner''s estimate of the cost of a disk page fetch that is part of a series of sequential fetches.', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Planner''s estimate of the cost of fetching sequence value', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Bitmap Index Scan does?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read the inner structures to access index pages more efficiently', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read in-memory bitmap to combine two indexes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read the leafs of bitmap index', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read the index and build bitmap of potential row locations', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Index Only Scan does?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read the whole index', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Go from the root to the only accepted value, if any', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Go from the root to the first leaf node with accepted value, than walk through leafs until condition is false without following table access', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Go from the root to the first leaf node with accepted value, than walk through leafs until condition is false, than access table pages, based on index info', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Bitmap Heap Scan does?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read the inner structures to access index pages more efficiently', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read in-memory bitmap to combine two indexes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read a row location bitmap generated by a Bitmap Index Scan and access corresponding table pages', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read the index and build bitmap of potential row locations', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the CTE Scan does?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read materialized CTE result', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Scan table pages to build and materialize CTE result', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Push rows from CTE result into consumer', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Calculate recursive query condition', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Custom Scan does?', 3, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'There is no such operation', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Data access through custom scan provider', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Data access through foreign data wrapper', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Data access through functional index', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Foreign Scan does?', 3, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'There is no such operation', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Data access through custom scan provider', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Data access through foreign data wrapper', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Data access through functional index', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Function Scan does?', 3, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'There is no such operation', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Data access through functional index', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Data access through custom scan provider', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Scans the result of a set-returning function', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Subquery Scan does?', 3, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'There is no such operation', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Nested loop join', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Scanning output of subquery', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Perform subquery to use in main query', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Table Sample Scan does?', 3, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'There is no such operation', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Check if existing plan good enough to be reused with current bind variable values', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Scanning table to get random data for TABLESAMPLE clause', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Scanning table to check if statistics still fresh', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Tid Scan does?', 3, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'There is no such operation', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Gathering data to build an index', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Building ctid map to combine it with values from another index', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Access to table page through ctid system column', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Values Scan does?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'There is no such operation', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Scan through data, provided by VALUES clause', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Inserting data by insert into .. values ()', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Gather key values from index to perform join', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Work Table Scan does?', 3, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'There is no such operation', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Lookup table which are already in memory', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Scans the materialized subquery result', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Scans the work table used in evaluating a recursive common table expression', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What the Recheck Cond does?', 3, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Examine which rows on page needs to return', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Combine multiple indexes into one', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Remove uncommited changes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'There is no such operation', currval('s_questions'));

commit;