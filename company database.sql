create database company;

CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


-- -----------------------------------------------------------------------------

-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

select first_name as forename, last_name as surname from employee;
select distinct branch_id from employee;

-- Numeric functions abs, mod, sqrt, power, greatest, least, truncate, round, avg, count, sum
select count(super_id) from employee;
select count(emp_id) from employee where sex = 'F' and birthday > '1970-01-01';
select avg(salary) from employee where sex = 'M';
select sum(salary) from  employee;
select count(sex), sex from employee group by sex;
select avg(total_sales), client_id from works_with group by client_id order by avg(total_sales) desc;

--                                 WILDCARDS    % - any number of characters, _ - one character
select * from client where client_name like '%LLC';
select * from branch_supplier where supplier_name like '%label%';
select * from employee where birthday like '____-10-__';    # employees born in October or '%-10-%'
select * from client where client_name like '%school%';    # clients who are schools

--                                          UNIONS
select sum(total_sales) as Earned_money from works_with
union
select sum(salary) as Spent_money from employee;
select client_name, branch_id from client          #  in order to not get confused client.branch_id could be used
union 
select supplier_name, branch_id from branch_supplier;  #  branch_supplier.branch_id could be used

--                                          JOINS
insert into branch values(4, 'Buffalo', null, null);
select * 
from employee join branch;      #   Cartesian product of two sets of rows
select * 
from employee join branch on employee.branch_id = branch.branch_id;
select emp_id, f_name, branch_name 
from employee join branch on emp_id = mgr_id;
select emp_id, f_name, branch_name 
from employee left join branch on emp_id = mgr_id;
select emp_id, f_name, branch_name 
from employee right join branch on emp_id = mgr_id;
delete from branch 
where branch_id = 4;
select * 
from branch;

--                                      Nested Queries
-- find names of all employees who've sold over 30000 to a single client
select emp_id, f_name, l_name 
from employee
 where emp_id in (select emp_id from works_with where total_sales >30000);
-- find all clients who are handled by the branch that Michael Scott manages, assume you know Michael's id
select * 
from client 
where branch_id = (select branch_id from employee where f_name = 'Michael');  # add limit 1 in case Michael is a manager of more than 1 companies

--                                          ON DELETE
delete from employee where emp_id = 102;
select * from employee;
select * from branch;
select * from works_with;
select * from branch_supplier;
select * from client;

--                                          Triggers
drop table trigger_table;
create table trigger_table(
	message varchar(30)
);
drop trigger my_trigger;
delimiter $$
create trigger my_trigger before insert on employee for each row begin 
	if new.sex = 'M' then insert into trigger_table values('added male employee');
    elseif new.sex = 'F' then insert into trigger_table values('added female employee');
    else insert into trigger_table values('added other employee');
    end if;
end $$
delimiter ;
insert into employee values(55, 'Oscar', 'Martinez', '1997-07-19', 'M', 10000, 106, 3);
select * from employee;
select * from trigger_table;
delete from employee where emp_id=55;