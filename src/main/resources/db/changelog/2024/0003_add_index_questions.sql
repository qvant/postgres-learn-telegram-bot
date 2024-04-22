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


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'Can SP-GIST store keys, longer than disk page?', 3, id
from categories where name = 'indexes');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Yes, always', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Yes, when operator keep extra info in parent page prefixes', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'No, key must fit disk page', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Yes, but only for strings', currval('s_questions'));


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How many pages index one BRIN record by default?', 3, id
from categories where name = 'indexes');
insert into answers(id, text, question_id) values (nextval('s_answers'), '1', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '32', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '128', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '512', currval('s_questions'));


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'Which data keeps BRIN for number?', 3, id
from categories where name = 'indexes');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'All values', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'All values and their quantities', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'All values and their TIDs', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Only min and max values', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');



insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How BRIN maintained during INSERT?', 3, id
from categories where name = 'indexes');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Aggregate info extended, if needed', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Aggregate info extended and new TID added', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''doesn''t maintained during INSERT', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Aggregate info completely recalculated', currval('s_questions'));

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How BRIN maintained during DELETE?', 3, id
from categories where name = 'indexes');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Aggregate info extended, if needed', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''doesn''t maintained during delete', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Old TID removed', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Aggregate info completely recalculated', currval('s_questions'));


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How BRIN works?', 3, id
from categories where name = 'indexes');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It stores array of keys per pages range', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It stores array of keys per pages range and their respective TIDs', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It stores aggregated data per pages range, e.g. min and max values', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It stores array of keys and TID of their first occurrence in range', currval('s_questions'));


commit;