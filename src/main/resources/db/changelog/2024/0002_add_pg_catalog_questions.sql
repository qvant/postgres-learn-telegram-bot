-- liquibase formatted sql
--changeset <author name>:<0002>


insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'Which table keep all triggers?', 1, id
from categories where name = 'pg_catalog');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_triggers', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_triggers', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_objects', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_object', currval('s_questions'));

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'Which table keep statistic?', 1, id
from categories where name = 'pg_catalog');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_class', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_objects', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_stats', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_object', currval('s_questions'));

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'Which table does not keep roles?', 2, id
from categories where name = 'pg_catalog');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_authid', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_roles', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_user', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_class', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

insert into questions(id, text, level_id, category_id) (select nextval('s_questions'), 'Which table keep roles?', 2, id
from categories where name = 'pg_catalog');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_am', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_class', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_stats', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'pg_shadow', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

commit;