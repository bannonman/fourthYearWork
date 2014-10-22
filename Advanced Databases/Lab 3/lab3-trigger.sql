drop table Teams;
drop table Matches;
drop table testTable;

Create Table Teams(
  TeamID integer,
  TeamName varchar(50),
  TeamCounrty varchar(30)check(TeamCounrty = 'England' or TeamCounrty = 'Spain')
);


Create Table Matches(
  MatchID integer,
  TeamA_ID integer,
  TeamB_ID integer,
  Goal_A number(2)check(Goal_A >= 0),
  Goal_B number(2)check(Goal_B >= 0),
  Competition varchar(30) check(competition = 'Champions League' or competition = 'Europa League' or competition = 'Premier League' or competition = 'La Liga')
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
insert into Teams values(6,'Real Madrid', 'Spain');
insert into Teams values(7,'Getafe', 'Spain');
insert into Teams values(8,'Sevilla', 'Spain');

insert into Matches values(1,1,2,0,2,'Premier League');
insert into Matches values(2,3,4,2,1,'Premier League');
insert into Matches values(3,5,6,4,0,'La Liga');
insert into Matches values(4,7,9,0,6,'La Liga');

insert into Matches values(4,1,9,0,6,'La Liga');
insert into Matches values(5,2,5,4,0,'Champions League');
insert into Matches values(6,1,7,2,2,'Europa League');
commit; 

insert into Matches values(3,1,2,2,1,'Premier League');
insert into Matches values(2,5,6,5,0,'La Liga');


select * from Teams where TeamName = 'Liverpool';
--PART A.
/*
CREATE OR REPLACE TRIGGER trig_Table
AFTER INSERT on Teams
BEGIN
  INSERT into testTable values ('insert done', SYSDATE);
END;
*/
--PART E
/*
e) Using a trigger, check that, if Premier League or La Liga is selected, the country of 
the two teams is correct (both England for Premier League and both Spain for La 
Liga). 
CREATE OR REPLACE TRIGGER check_league
BEFORE INSERT or UPDATE ON Matches
FOR EACH ROW
DECLARE
  country_A VARCHAR(20);
  country_B VARCHAR(20);
BEGIN
  SELECT TeamCounrty INTO country_A FROM teams WHERE TeamID=:new.TeamA_ID;
  SELECT TeamCounrty INTO country_B FROM teams WHERE TeamID=:new.TeamB_ID;
	IF (country_A = 'Spain' AND country_B = 'Spain' AND :new.competition !='La Liga') THEN
    Raise_application_error(-20002,'La Liga Error');
  ELSIF (country_A = 'England' AND country_B = 'England' AND :new.competition !='Premier League') THEN
    Raise_application_error(-20003,'Premier League Error');
  ELSIF (country_A = 'England' AND country_B = 'Spain' AND (:new.competition !='Champions League' or :new.competition !='Europa League')) THEN
    Raise_application_error(-20004,'European Error');
  ELSIF (country_A = 'Spain' AND country_B = 'England' AND (:new.competition !='Champions League' or :new.competition !='Europa League')) THEN
    Raise_application_error(-20004,'European Error');
  END IF;
END;
*/

/*
f) Using a trigger, check that a team has no more than 3 home matches in the table 
matches. 

CREATE OR REPLACE TRIGGER check_home_fixt
BEFORE INSERT or UPDATE ON matches
FOR EACH ROW
DECLARE
  count_home NUMBER;
BEGIN
  SELECT COUNT(*) INTO count_home FROM matches WHERE TeamA_ID=:new.TeamA_ID;
	IF count_home>=3 THEN
    Raise_application_error(-20005,'Home Games Full');
  END IF;
END;
*/
