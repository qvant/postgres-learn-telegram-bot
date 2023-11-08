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

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What''s length of hash index key?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '32 bit', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '64 bit', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '128 bit', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Equal to key column length', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What are not part of hash index page?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Key hash', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Key value', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'TID', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Double-linked pages list pointers', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What types of pages hash index has?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Root and leaf', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Meta and backet', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Meta, backet, overflow and bitmap', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Meta, backet and bitmap', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'What an overflow page in hash index?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Page, that keeps columns, which are not part of index key', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Additional index meta information', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Part of index keys that don''t fit backet key', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Extras pages that keep pairs (hash, tid), which don''t fit backet page' , currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

commit;