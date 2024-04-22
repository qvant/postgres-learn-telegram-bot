-- liquibase formatted sql
--changeset <author name>:<0004>


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'What is data datatype alignment?', 3, id
from categories where name = 'data types');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Padding before fixed-length columns to force them to start from given offset', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Alphabetically ordering columns in row while put them on disc', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Number of bytes from the beginning of page to the first row header', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Number of bytes from the beginning of page to the specific row header', currval('s_questions'));


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How the int8 datatype aligned?', 3, id
from categories where name = 'data types');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''s doesn''t aligned at all', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 2 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 4 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 8 bytes', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How the int4 datatype aligned?', 3, id
from categories where name = 'data types');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''s doesn''t aligned at all', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 2 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 4 bytes', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 8 bytes', currval('s_questions'));

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How the int2 datatype aligned?', 3, id
from categories where name = 'data types');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''s doesn''t aligned at all', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 2 bytes', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 4 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 8 bytes', currval('s_questions'));


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How the text datatype aligned?', 3, id
from categories where name = 'data types');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''s doesn''t aligned at all', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 2 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 4 bytes', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 8 bytes', currval('s_questions'));


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How the bigint datatype aligned?', 3, id
from categories where name = 'data types');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''s doesn''t aligned at all', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 2 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 4 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 8 bytes', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How the integer datatype aligned?', 3, id
from categories where name = 'data types');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''s doesn''t aligned at all', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 2 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 4 bytes', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 8 bytes', currval('s_questions'));

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How the date datatype aligned?', 3, id
from categories where name = 'data types');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''s doesn''t aligned at all', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 2 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 4 bytes', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 8 bytes', currval('s_questions'));


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How the varchar datatype aligned?', 3, id
from categories where name = 'data types');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''s doesn''t aligned at all', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 2 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 4 bytes', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 8 bytes', currval('s_questions'));

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How the double precision datatype aligned?', 3, id
from categories where name = 'data types');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''s doesn''t aligned at all', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 2 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 4 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 8 bytes', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How the float datatype aligned?', 3, id
from categories where name = 'data types');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''s doesn''t aligned at all', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 2 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 4 bytes', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 8 bytes', currval('s_questions'));

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How the json datatype aligned?', 3, id
from categories where name = 'data types');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''s doesn''t aligned at all', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 2 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 4 bytes', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 8 bytes', currval('s_questions'));

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'How the jsonb datatype aligned?', 3, id
from categories where name = 'data types');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'It''s doesn''t aligned at all', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 2 bytes', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 4 bytes', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'Up to 8 bytes', currval('s_questions'));



commit;