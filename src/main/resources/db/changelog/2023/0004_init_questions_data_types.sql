-- liquibase formatted sql
--changeset <author name>:<0004>


--data types questions
insert into categories (id, name) values (nextval('s_categories'), 'data types');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What is difference between serial and int4?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Serial also create sequence for the column in question, used as the default value', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Serial enforces unique constraint on the column', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Serial is equivalent of int8', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Serial and int4 are the same datatype', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which fact about json datatype is incorrect?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Json keep data as is, the exact copy on original text', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'JSON in json field must be correct' , currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Json keep data in binary key-value format', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Json preserve order of keys', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which fact about jsonb datatype is incorrect?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Jsonb keep data as is, the exact copy on original text', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'JSONb in json field must be correct' , currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Jsonb keep data in binary key-value format', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Json does not preserve order of keys', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What is epoch?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '1970-01-01 00:00:00+00 ', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'later than all other time stamps' , currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'earlier than all other time stamps', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '2^32-1', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What is infinity?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '1970-01-01 00:00:00+00 ', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'later than all other time stamps' , currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'earlier than all other time stamps', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '2^32-1', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What is -infinity?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '1970-01-01 00:00:00+00 ', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'later than all other time stamps' , currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'earlier than all other time stamps', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '2^32-1', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What is now?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'current time on server', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'current time on client', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'current transaction''s start time', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'midnight (00:00) today', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What is today?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'current time on server', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'current time on client' , currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'current transaction''s start time', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'midnight (00:00) today', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which value are NOT allowed for boolean?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'yes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'on' , currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'truth', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '1', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which value are allowed for boolean?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'nope', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'off' , currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '-1', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'nil', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which value are not allowed for float?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Infinity', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-Infinity' , currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'nil', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'NaN', currval('s_questions'));


insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which value are not allowed for float?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Inf', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'infinity' , currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'INFINITY', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'All three values are allowed', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');


commit;