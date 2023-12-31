-- liquibase formatted sql
--changeset <author name>:<0003>


--psql questions
insert into categories (id, name) values (nextval('s_categories'), 'psql');
insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to list data types?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'du', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dt', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dT', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dp', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to list roles?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'du', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dt', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dT', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dp', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to list tables, views and sequences?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'du', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dt', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dT', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dp', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to print something into standard output?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'print', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'output', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'echo', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'debug', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to show or set client encoding?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'cp', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'encoding', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'chcp', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'lang', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to specify db name to connect?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-d', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '-db', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-database', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'b', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to specify host to connect?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-db', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-s', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-host', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-h', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to list all databases?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-db', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-l', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '-adb', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-ld', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to switch to another database?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-c db_name', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'connect db_name', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\c db_name', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '-switch db_name', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to list tables?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'du', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dt', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dT', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), 'dp', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to describe a table?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\t', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\d', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '\dt', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\D', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to list all schemas?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\s', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\ls', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\dn', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '\ds', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to list users and their roles?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\u', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\lu', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\dr', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\du', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to list all functions?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\df', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '\lf', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\dp', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\ds', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to list all views?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\dt', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\dv', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '\lv', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\l', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to save query results into file?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\s', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\p', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\o', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '\f', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to stop save query results into file?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\s', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\p', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\o', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '\f', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to run commands from file?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\c', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\f', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\r', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\i', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to quit from psql?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\q', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '\e', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\q!', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\wq!', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to print information about current connection?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\c', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\conn', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\conninfo', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '\conect', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to repeat query every N seconds?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\cron', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\repeat', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\tail', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\watch', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');


insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to connect to the database?', 1, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '\connect db_name', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), 'connect db_name', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '--connect db_name', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-run db_name', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to enforce psql to ask password?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-w', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-W', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '-p', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-ef', currval('s_questions'));

insert into questions(id, text, level_id, category_id) values (nextval('s_questions'), 'How to enforce psql to ask password?', 2, currval('s_categories'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '-w', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '--force', currval('s_questions'));
insert into answers(id, text, question_id) values (nextval('s_answers'), '--password', currval('s_questions'));
update questions set correct_answer_id = currval('s_answers') where id = currval('s_questions');
insert into answers(id, text, question_id) values (nextval('s_answers'), '--force-password', currval('s_questions'));

commit;