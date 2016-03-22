mysql -uroot -e "DROP DATABASE ASK"
mysql -uroot -e "CREATE DATABASE ASK"
mysql -uroot -e "CREATE USER 'moof'@'localhost' IDENTIFIED BY '1234'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON ASK.* TO 'moof'@'localhost'"

python /home/box/web/ask/manage.py syncdb

mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_question(title,text,rating) VALUES ('title1','qa1',3)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_question(title,text,rating) VALUES ('title2','qa2',1)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_question(title,text,rating) VALUES ('title3','qa3',6)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_question(title,text,rating) VALUES ('title4','qa4',8)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_question(title,text,rating) VALUES ('title5','qa5',12)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_question(title,text,rating) VALUES ('title6','qa6',15)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_question(title,text,rating) VALUES ('title7','qa7',2)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_question(title,text,rating) VALUES ('title8','qa8',1)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_question(title,text,rating) VALUES ('title9','qa9',2)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_question(title,text,rating) VALUES ('title10','qa10',3)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_question(title,text,rating) VALUES ('title11','qa11',10)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_question(title,text,rating) VALUES ('title12','qa12',6)"

mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_answer(text, question_id) VALUES ('answer1', 1)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_answer(text, question_id) VALUES ('answer1', 1)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_answer(text, question_id) VALUES ('answer1', 1)"

mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_answer(text, question_id) VALUES ('answer2', 2)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_answer(text, question_id) VALUES ('answer2', 2)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_answer(text, question_id) VALUES ('answer2', 2)"

mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_answer(text, question_id) VALUES ('answer3', 3)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_answer(text, question_id) VALUES ('answer3', 3)"
mysql -uroot -e "USE ASK; INSERT INTO ASK.qa_answer(text, question_id) VALUES ('answer3', 3)"
