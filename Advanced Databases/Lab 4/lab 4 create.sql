drop table persons;
drop table jobs_person; 
drop table jobs;
create table persons( 
person_id integer, 
person_name varchar(20), 
person_surname varchar(20), 
person_age integer not null, 
person_wealth integer, 
person_weight float 
); 


create table jobs_person( 
jobs_id integer, 
person_id integer, 
start_date date, 
end_date date); 


create table jobs( 
jobs_id integer, 
job_description varchar(200), 
salary integer 
); 


/* 3. populate table jobs-persons */ 
declare j_id number; 
 p_id integer; 
 start_date date; 
 end_date date; 
 st integer; 
 en integer; 
BEGIN 
 FOR i IN 1..10000 LOOP 
 FOR j in 1..15 LOOP 
 SELECT TRUNC(DBMS_RANDOM.VALUE(0,1000000)) into p_id FROM DUAL; 
 SELECT TRUNC(DBMS_RANDOM.VALUE(0, 1000)) into st FROM DUAL; 
 SELECT TRUNC(DBMS_RANDOM.VALUE(0, 2000)) into en FROM DUAL; 
 SELECT TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2452641,2452641+st)),'J') 
into start_date FROM DUAL; 
 SELECT 
TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2452641+st,2452641+st+en)),'J') into 
end_date FROM DUAL; 
 insert into jobs_person values(i,p_id,start_date,end_date); 
 END LOOP; 
 END LOOP; 
end;