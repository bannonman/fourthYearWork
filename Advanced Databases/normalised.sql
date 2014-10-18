drop table student;
drop table address;
drop table application;
drop table c_reference;
drop table oldschool;

Create Table student(
  StudentID integer,
  StudentName varchar(50),
  Street varchar(100),
  State varchar(30),
  ZipCode varchar(30),
  GPA number(2)
);

Create Table address(
  State varchar(30),
  ZipCode varchar(7)
);

Create Table application(
   App_No integer,
   App_Year integer
);

Create Table c_reference(
  ReferenceName varchar(100),
  RefInstitution  varchar(100),
  ReferenceStatement varchar(500)
);

Create Table oldschool(
  PriorSchoolId integer,
  PriorSchoolAddr varchar(100),
  GPA number(2)
);

insert into student values(6,'Susan','River Road','Kansas','Kan45',45);
insert into address values('Kansas','Kan45');
insert into application values(3,2011);
insert into c_reference values('Prof. Cahill','UCC','Good');
insert into oldschool values(2,'Loreto College', 45);

commit; 

select * from student;
select * from address;
select * from application;
select * from c_reference;
select * from oldschool;



