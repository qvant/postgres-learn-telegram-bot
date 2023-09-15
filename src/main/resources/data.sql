insert into levels (id, name) values (1, 'Junior');
insert into levels (id, name) values (2, 'Middle');
insert into levels (id, name) values (3, 'Senior');
insert into questions(id, text) values (-1, 'some question');
insert into answers(id, text, question_id) values (-1, 'AA', -1);
insert into answers(id, text, question_id) values (-2, 'BB', -1);
update questions set correct_answer_id = -1 where id = -1;
commit;