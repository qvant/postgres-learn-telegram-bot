-- liquibase formatted sql
--changeset <author name>:<0003>


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'Which data structure used by GIST index?', 3, id
from categories where name = 'indexes');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'B-tree', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'R-tree', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Hashmap', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Linked list', currval('s_questions'));

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'Which data structure used by GIN index?', 3, id
from categories where name = 'indexes');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'B-tree', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'R-tree', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Hashmap', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Linked list', currval('s_questions'));

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'What is posting list in GIN?', 3, id
from categories where name = 'indexes');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Indexed lexemes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Linked list which connect leaf nodes of t-tree ', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'TID''s of rows, which contains lexemes. stored together with them', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'TID''s of rows, which contains lexemes. stored in separate b-tree', currval('s_questions'));

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'What is posting tree in GIN?', 3, id
from categories where name = 'indexes');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Indexed lexemes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Linked list which connect leaf nodes of t-tree ', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'TID''s of rows, which contains lexemes. stored together with them', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'TID''s of rows, which contains lexemes. stored in separate b-tree', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'What does fastupdate parameter of GIN?', 3, id
from categories where name = 'indexes');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Make buffer and enforce writing index updates in batch', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Prevent write amplification on row update', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Allow HOT updates for table with GIN index', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Defer constraint check, enforced ny GIN index', currval('s_questions'));



commit;