# ER diagrams
## GeeksforGeeks Introduction of ER Model - https://www.geeksforgeeks.org/introduction-of-er-model/
## YouTube Giraffe Academy - https://youtu.be/Ql0w3x6gGI4?si=AQz5AehnrtmlMokg
![ER model_1](https://github.com/user-attachments/assets/cdc8410b-201b-4960-a713-dcdc16a84163)
![ER_model_2](https://github.com/user-attachments/assets/2b843b40-4277-4b91-b843-bdd39c4e3b3b)
## Creating ER diagram of the company database
![IMG_0422](https://github.com/user-attachments/assets/94bc9551-2108-4c58-b686-e950b5059b2a)
## Creating relations(tables) from the diagram 
![IMG_5594](https://github.com/user-attachments/assets/916c4b87-723c-4863-96d5-88cb695e25ce)
## Company database with inserted rows
![IMG_5595](https://github.com/user-attachments/assets/ed3e97a1-2246-4f10-8e00-9d522b5adc06)

# Database indexing
## Database indexing for dumb developers - https://youtu.be/lYh6LrSIDvY?si=rDniWfQ_IcXFUdjY
## How do SQL indexes work - https://youtu.be/YuRO9-rOgv4?si=Z_0YB4L4yhSHj2D6
## Indexing on one column and comparing perfomances of the same query before and after indexing
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
![IMG_5596](https://github.com/user-attachments/assets/fa9ef96f-b1f1-4219-897c-2a9835d6ce69)
