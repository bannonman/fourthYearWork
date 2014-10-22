drop table boards;
drop table results;
drop table exam;
drop table student;

create table student(
student_id varchar(8) primary key,
s_fname varchar(20),
s_sname varchar(20)
);


create table exam(
exam_code varchar(4)  primary key,
exam_weight number(2,1),
ca_weight number(2,1),
exam_name varchar(20)
);

create table results(
student_id varchar(8),
exam_code varchar(4),
exam_marks number check (exam_marks >= 0 and exam_marks <= 100),
ca_marks number check (ca_marks >= 0 and ca_marks <= 100),
CONSTRAINT pk_ResultsID PRIMARY KEY (student_id,exam_code),
FOREIGN KEY(exam_code) REFERENCES EXAM(exam_code),
FOREIGN KEY(student_id) REFERENCES STUDENT(student_id)
);

create table boards(
student_id varchar(8),
exam_code varchar(4),
b_result number(4,1),
decision varchar(3) check (decision in ('RE','RCA','RAC', 'A', 'B', 'C', 'D')),
CONSTRAINT pk_BoardsID PRIMARY KEY (student_id,exam_code),
FOREIGN KEY(exam_code) REFERENCES EXAM(exam_code),
FOREIGN KEY(student_id) REFERENCES STUDENT(student_id)
);

commit;