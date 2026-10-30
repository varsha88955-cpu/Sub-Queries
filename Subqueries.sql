-- SINGLE ROW SUBQUERIES

select * from employees where salary = (select max(salary) from employees);
select * from employees where salary = (select min(salary) from employees);
select * from employees where salary > (select avg(salary) from employees);
select * from employees where salary < (select avg(salary) from employees);
select * from employees where salary = (select salary from employees where name = 'Rahul');
select * from employees where salary > (select salary from employees where name = 'Karthik');
select * from employees where salary < (select salary from employees where name = 'Sneha');
select * from employees where salary >= (select salary from employees where name = 'Priya');
select * from employees where department_id = 2 and salary = (select max(salary) from employees where department_id = 2);
select * from employees where department_id = 1 and salary = (select min(salary) from employees where department_id = 1);
select * from employees where salary > (select avg(salary) from employees where department_id = 1);
select * from employees where salary < (select avg(salary) from employees where department_id = 2);
select * from employees where salary = (select max(salary) from employees where department_id = (select department_id from employees where name = 'Rahul'));
select * from employees where salary > (select max(salary) from employees where department_id = 3);
select * from employees where salary < (select min(salary) from employees where department_id = 2);
select * from employees where salary = (select max(salary) from employees where salary < (select max(salary) from employees));
select * from employees where salary = (select min(salary) from employees where salary > (select min(salary) from employees));
select * from employees where salary > (select avg(salary) from employees) and salary < (select max(salary) from employees);
select * from employees where salary = (select avg(salary) from employees where department_id = 1);
select * from employees where salary > (select avg(salary) from employees where department_id = (select department_id from employees where name = 'Rahul'));


-- MULTI ROW SUBQUERIES

select * from employees where department_id in (select department_id from employees where name in ('Karthik','Mahesh'));
select * from employees where salary in (select salary from employees where department_id = 104);
select * from employees where department_id not in (select department_id from employees where name in ('Karthik','Rahul'));
select * from employees where salary > any (select salary from employees where department_id = 1);
select * from employees where salary > all (select salary from employees where department_id = 1);
select * from employees where salary < any (select salary from employees where department_id = 2);
select * from employees where salary < all (select salary from employees where department_id = 2);
select * from employees where salary = any (select salary from employees where department_id = 2);
select * from employees where salary <> all (select salary from employees where department_id = 1);
select * from employees where department_id in (select department_id from employees group by department_id having count(*) > 1);
select * from employees where department_id in (select department_id from employees group by department_id having avg(salary) > 60000);
select * from employees where department_id in (select department_id from employees where salary > 70000);
select * from employees where salary > any (select salary from employees where department_id = 3);
select * from employees where salary > all (select salary from employees where department_id = 3);
select * from employees e where exists (select 1 from departments d where d.dept_id = e.department_id);
select * from employees e where not exists (select 1 from departments d where d.dept_id = e.department_id);
select * from employees where department_id in (select department_id from employees where name in ('Rahul','Priya'));
select * from employees where salary > all (select salary from employees where name in ('Karthik','Rahul','Anil'));
select * from employees where department_id in (select department_id from employees where salary > 80000);
select * from employees where salary > all (select salary from employees where department_id = 2);


-- MULTI COLUMN SUBQUERIES

select * from employees where (department_id,salary) in (select department_id,max(salary) from employees group by department_id);
select * from employees where (department_id,salary) in (select department_id,min(salary) from employees group by department_id);
select * from employees where (department_id,salary) = (select department_id,salary from employees where name = 'Karthik');
select * from employees where (department_id,salary) = (select department_id,salary from employees where name = 'Rahul');
select * from employees where (department_id,salary) in (select department_id,salary from employees where name in ('Karthik','Priya'));
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary > 70000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id = 1);
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id = 2);
select * from employees where (department_id,salary) not in (select department_id,salary from employees where department_id = 1);
select * from employees where (department_id,salary) not in (select department_id,salary from employees where department_id = 2);
select * from employees where (department_id,salary) <> (select department_id,salary from employees where name = 'Karthik');
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary = (select max(salary) from employees where salary > 40000));
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary = (select min(salary) from employees where salary < 70000));
select * from employees where (department_id,salary) in (select department_id,salary from employees where name like 'A%');
select * from employees where (department_id,salary) in (select department_id,salary from employees where name like 'R%');
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id in (1,2,3));
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary between 40000 and 70000);
select * from employees where (department_id,salary) in (select department_id,max(salary) from employees group by department_id);
select * from employees where (department_id,salary) = (select department_id,salary from employees where name = 'Karthik');
select * from employees where (department_id,salary) > (select department_id,salary from employees where name = 'Karthik');


-- IN OPERATOR

select * from employees where department_id in (select department_id from employees where salary > 60000);
select * from employees where department_id in (select department_id from employees where name = 'Karthik');
select * from employees where department_id in (select department_id from employees where name in ('Karthik','Priya'));
select * from employees where department_id in (select department_id from employees where salary < 40000);
select * from employees where department_id in (select department_id from employees where salary = 75000);
select * from employees where department_id in (select department_id from employees where name like 'A%');
select * from employees where department_id in (select department_id from employees where name like 'S%');
select * from employees where department_id in (select department_id from employees where salary between 50000 and 70000);
select * from employees where department_id in (select department_id from employees where salary > 80000);
select * from employees where department_id in (select department_id from employees where salary > (select avg(salary) from employees));


-- NOT IN OPERATOR

select * from employees where department_id not in (select department_id from employees where salary > 80000);
select * from employees where department_id not in (select department_id from employees where name = 'Karthik');
select * from employees where department_id not in (select department_id from employees where name in ('Karthik','Priya'));
select * from employees where department_id not in (select department_id from employees where salary < 40000);
select * from employees where department_id not in (select department_id from employees where salary = 75000);
select * from employees where department_id not in (select department_id from employees where name like 'A%');
select * from employees where department_id not in (select department_id from employees where salary between 50000 and 70000);


-- ANY OPERATOR

select * from employees where salary > any (select salary from employees where department_id = 1);
select * from employees where salary < any (select salary from employees where department_id = 2);
select * from employees where salary > any (select salary from employees where department_id = 3);
select * from employees where salary < any (select salary from employees where department_id = 4);
select * from employees where salary > any (select salary from employees where salary < 50000);
select * from employees where salary < any (select salary from employees where salary > 80000);
select * from employees where salary >= any (select salary from employees where department_id = 2);


-- ALL OPERATOR

select * from employees where salary > all (select salary from employees where department_id = 1);
select * from employees where salary < all (select salary from employees where department_id = 2);
select * from employees where salary > all (select salary from employees where department_id = 3);
select * from employees where salary < all (select salary from employees where department_id = 4);
select * from employees where salary > all (select salary from employees where salary < 50000);
select * from employees where salary >= all (select salary from employees where department_id = 2);


-- BEGINNER MULTI COLUMN

select * from employees where (department_id,salary) = (select department_id,salary from employees where name = 'Karthik');
select * from employees where (department_id,salary) = (select department_id,salary from employees where name = 'Rahul');
select * from employees where (department_id,salary) in (select department_id,salary from employees where name in ('Karthik','Priya'));
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary > 60000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary < 50000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id = 1);
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id = 2);
select * from employees where (department_id,salary) in (select department_id,salary from employees where name like 'A%');
select * from employees where (department_id,salary) in (select department_id,salary from employees where name like 'R%');
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary between 50000 and 70000);


-- INTERMEDIATE MULTI COLUMN

select * from employees where (department_id,salary) in (select department_id,max(salary) from employees group by department_id);
select * from employees where (department_id,salary) in (select department_id,min(salary) from employees group by department_id);
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary > 70000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary < 45000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where name like '%a%');
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary > (select avg(salary) from employees));
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary in (75000,90000));
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id in (1,2,3));
select * from employees where (department_id,salary) not in (select department_id,salary from employees where name = 'Karthik');
select * from employees where (department_id,salary) not in (select department_id,salary from employees where salary > 80000);


-- ADVANCED MULTI COLUMN

select * from employees where (department_id,salary) in (select department_id,max(salary) from employees group by department_id);
select * from employees where (department_id,salary) in (select department_id,min(salary) from employees group by department_id);
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary = (select max(salary) from employees where salary > 40000));
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary = (select min(salary) from employees where salary < 70000));
select * from employees where (department_id,salary) in (select department_id,max(salary) from employees group by department_id having max(salary) > 60000);
select * from employees where (department_id,salary) in (select department_id,min(salary) from employees group by department_id having min(salary) < 50000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where name like 'A%' or name like 'S%');
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary > 50000 and department_id in (1,2,4));
select * from employees where (department_id,salary) = (select department_id,salary from employees where name = 'Karthik');
select * from employees where (department_id,salary) > (select department_id,salary from employees where name = 'Karthik');
