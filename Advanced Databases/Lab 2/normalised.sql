drop table student;
drop table address;
drop table application;
drop table application_info;
drop table prior_school;
drop table prior_info;
drop table state;

Create Table student(
  StudentID integer,
  StudentName varchar(20),
  S_addr varchar(30)
);

Create Table address(
  S_addr varchar(50),
  street varchar(20),
  Zip varchar(7),
  StudentID integer
);

Create Table application(
   App_No integer,
   App_Year integer,
   StudentID integer
);

Create Table application_info(
  ReferenceName varchar(50),
  RefInstitution  varchar(50),
  ReferenceStatement varchar(100),
  App_No integer,
  App_Year integer
);

Create Table prior_school(
  PriorSchoolId integer,
  StudentID integer
);

Create Table prior_school_info(
  PriorSchoolId integer,
  PriorSchoolAddr varchar(50),
  GPA number(2)
);

create Table State(
  Zip varchar(7),
  State varchar(20)
);

insert into student values(1,'Susan','River Road Kansas Kan 45');
insert into address values('River Road Kansas Kan45','River Road','Kan45',1);
insert into application values(3,2011, 1);
insert into application_info values('Prof. Cahill','UCC','Good', 3, 2011);
insert into prior_school values(2,1);
insert into prior_school_info values(2,'Loreto College', 21);
insert into State values('Kan45', 'Kansas');

commit; 



select * from student;
select * from address;
select * from application;
select * from application_info;
select * from prior_school;
select * from prior_school_info;
select * from State;




