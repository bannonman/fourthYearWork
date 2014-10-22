CREATE OR REPLACE TRIGGER exam_before_insert_or_update
BEFORE INSERT OR UPDATE
   ON exam
   FOR EACH ROW
DECLARE
  v_total number(2,1) := 1.0;
BEGIN
  IF ((:new.exam_weight + :new.ca_weight) <> v_total) THEN
    RAISE_APPLICATION_ERROR(-20001,'Exam & CA weighting must combine to make 100%');
  END IF;
END;