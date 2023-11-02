-- liquibase formatted sql
--changeset <author name>:<0006>


--Index questions
insert into categories (id, name) values (nextval('s_categories'), 'indexes');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which operations are not supported by btree index?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '<', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'like against pattern, started from literal', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'like against pattern, started from wildcard', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'is null', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How Postgres scan leafs during index scan?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Scan whole leaf fow values, then return to parent node to find a next leaf', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Scan only leafs through double linked list of siblings', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read all pointers to leafs from parent node and read them in batch, if it''s not enough, return to the parent''s parent', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Read all pointers to leafs from parent node and read them one-by-one, if it''s not enough, return to the parent''s parent', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'Which operations are supported by hash index?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '=', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '=, <, >', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '=, =<, >=', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '=, !=', currval('s_questions'));

commit;