/* just using one random database to create table to do indexing on one column
and see perfomances of the same query before and after indexing */
use company; 

drop table employees;

create table employees(
    ID int AUTO_INCREMENT primary key,
    Name varchar(50),
    Email varchar(50),
    Department varchar(50)
);

-- deleting the procedure if exists
DROP PROCEDURE if exists insert_rows;

-- Inserting a lot of rows into the table by creating procedure
-- This part of he code has to be implemented only via MySQL version Command Line Client
/*    
delimiter //

CREATE PROCEDURE insert_rows()
BEGIN
    DECLARE counter INT DEFAULT 1;  -- Initialize counter to 1

    WHILE counter <= 10000 DO

        insert into employees(Name, EmaiL, Department) 
        values(concat('ABC', counter), concat('abc', counter), concat('Dep', counter));

        SET counter = counter + 1;  -- Increment the counter
        
    END WHILE;
END //

delimiter ;
*/

-- calling the procedure
call insert_rows();

-- checking that rows have been inserted
select count(*) from employees;
select * from employees limit 10;

-- perfomance of the query before indexing column Name
explain analyze select * from employees where name = 'ABC5500';

-- Indexing the column Name
create index name on employees(Name);

-- perfomance of the query after indexing column Name
explain analyze select * from employees where name = 'ABC5500';

-- deleting indexing
drop index name on employees;
