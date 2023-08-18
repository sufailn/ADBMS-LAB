
create database Trig;
use trig;
 create table phonebook(pname varchar(15),mobno varchar(12));
 create table del_phonebook(pname varchar(15),mobno varchar(12), modify_date date);
 insert into phonebook values('sam','9846298648');
 insert into phonebook values('ram','9846298683');
 insert into phonebook values('jaim','9846298682');
 insert into phonebook values('siva','9846298618');
select * from phonebook;
 
 DELIMITER //
 CREATE TRIGGER save_old_mob
 AFTER DELETE
 ON phonebook
 FOR EACH ROW
 BEGIN
 INSERT INTO del_phonebook values(OLD.pname,OLD.mobno,sysdate());
 END;
 //
 desc phonebook;
 desc del_phonebook;
delete from phonebook where pname='jaim';

select * from del_phonebook;	
DELIMITER //
 CREATE TRIGGER save_old_mob4
 AFTER UPDATE
 ON phonebook
 FOR EACH ROW
 BEGIN
 INSERT INTO del_phonebook values(OLD.pname,OLD.mobno,sysdate());
 END;
 //
update phonebook set mobno='9847380040' where pname='sam';
select * from del_phonebook;