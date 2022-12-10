drop table tabNumber;
create table tabNumber
(
  col1 number(4,2)
);
insert into tabNumber
values
  ('12,15');

-- Creer une fonction qui reconnait un palindrome

CREATE OR REPLACE FUNCTION PALINDROME
(
  word VARCHAR2
)
RETURN INT
IS
BEGIN
  FOR I IN 1 .. LENGTH
  (word)/2 LOOP
  IF SUBSTR(word, I, 1) <> SUBSTR(word, -I, 1) THEN
  RETURN 0;
END
IF;
  END LOOP;
RETURN 1;
END PALINDROME;
/

DECLARE
    str  VARCHAR
(20) := 'aaba';
    len  NUMBER;
    str1 VARCHAR
(20) := '';
BEGIN
    str := '&str';
    len := Length
(str);
    FOR i IN REVERSE 1.. len LOOP
        str1 := str1 || Substr
(str, i, 1);
END LOOP;
if str = str1 then
        dbms_output.Put_line
(str || ' is Palindrome!' );
    else 
        dbms_output.Put_line
(str || ' is  not Palindrome!');
        dbms_output.Put_line
('Reverse of '|| str ||' is '|| str1);
end
if;
END;
