drop table Teams;
drop table Matches;
drop table testTable;

Create Table Teams(
  TeamID integer,
  TeamName varchar(50),
  TeamCounrty varchar(30)
);


Create Table Matches(
  MatchID integer,
  TeamA_ID integer,
  TeamB_ID integer,
  Goal_A number(2),
  Goal_B number(2),
  Competition varchar(30)
);


Create Table testTable(
  TeamCounrty varchar(20),
  DateStamp varchar(20)
);

insert into Teams values(1,'Arsenal', 'England');
insert into Teams values(2,'Liverpool', 'England');
insert into Teams values(3,'Chealsea', 'England');
insert into Teams values(4,'Manchester City', 'England');
insert into Teams values(5,'Barcelona', 'Spain');
insert into Teams values(6,'Rea Madrid', 'Spain');
insert into Teams values(7,'Getafe', 'Spain');
insert into Teams values(10,'Sevilla', 'Spain');

insert into Matches values(1,1,2,0,2,'Premier League');
insert into Matches values(2,3,4,2,1,'Premier League');
insert into Matches values(3,5,6,2,0,'Premier League');
insert into Matches values(4,7,8,0,6,'La Liga');
insert into Matches values(5,2,5,4,0,'Champions League');
insert into Matches values(6,1,7,2,2,'Europa Leauge');
commit; 


/*
select * from Teams where TeamName = 'Liverpool';
//PART A.

CREATE OR REPLACE TRIGGER trig_Table
AFTER INSERT on Teams
BEGIN
  INSERT into testTable values ('insert done', SYSDATE);
END;

select * from TESTTABLE;
*/
select * from Matches where MatchID=5;

