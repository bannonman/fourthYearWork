CREATE OR REPLACE PROCEDURE populate_boards
IS
  counter int;
  v_id student.student_id%type;
  v_ecode exam.exam_code%type;
  v_bres number(4,1);
  v_decision varchar(3);
  v_eweight exam.exam_weight%type;
  v_cweight exam.ca_weight%type;
  CURSOR c1 IS
    SELECT * FROM results;
BEGIN
  select count(*) into counter from user_tables where table_name = upper('boards');
  if counter = 1 then
    execute immediate 'DROP TABLE boards';
  end if;
  execute immediate 'create table boards(student_id varchar(8), exam_code varchar(4), b_result number(4,1), decision varchar(3))';
  execute immediate 'ALTER TABLE boards ADD CONSTRAINT pk_BoardsID PRIMARY KEY(student_id,exam_code)';
  execute immediate 'ALTER TABLE boards ADD CONSTRAINT fk1 FOREIGN KEY (student_id) REFERENCES student(student_id)';
  execute immediate 'ALTER TABLE boards ADD CONSTRAINT fk2 FOREIGN KEY (exam_code) REFERENCES exam(exam_code)';
  FOR item IN c1
    LOOP
      v_id := item.student_id;
      v_ecode := item.exam_code;
      SELECT exam_weight, ca_weight INTO v_eweight, v_cweight FROM exam where exam_code = v_ecode;
      v_bres := (item.exam_marks * v_eweight) + (item.ca_marks * v_cweight);
      IF (v_bres < 40) THEN
          IF(item.exam_marks >= 40)THEN
            v_decision := 'RCA';
          ELSIF(item.ca_marks >= 40)THEN
            v_decision := 'RE';
          ELSE
            v_decision := 'RAC';
        END IF;
      ELSIF (v_bres < 50) THEN
        v_decision := 'D';
      ELSIF (v_bres < 60) THEN
        v_decision := 'C';
      ELSIF (v_bres < 70) THEN
        v_decision := 'B';
      ELSE
        v_decision := 'A';
      END IF;
      insert into boards values(v_id,v_ecode,v_bres,v_decision);
    END LOOP;
END;