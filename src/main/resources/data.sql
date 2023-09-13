insert into answers(id, text) values (-1, 'AA');
insert into answers(id, text) values (-2, 'BB');
insert into questions(id, text) values (-1, 'some question');
insert into questions_answers(question_id, answers_id) values (-1, -1);
insert into questions_answers(question_id, answers_id) values (-1, -2);
update questions set correct_answer_id = -1 where id = -1;
commit;