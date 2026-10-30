-- single row subqueries

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
select * from employees where department_id = (select department_id from employees where name = 'Rahul') and salary = (select max(salary) from employees where department_id = (select department_id from employees where name = 'Rahul'));
select * from employees where salary > (select max(salary) from employees where department_id = 3);
select * from employees where salary < (select min(salary) from employees where department_id = 2);
select * from employees where salary = (select max(salary) from employees where salary < (select max(salary) from employees));
select * from employees where salary = (select min(salary) from employees where salary > (select min(salary) from employees));
select * from employees where salary > (select avg(salary) from employees) and salary < (select max(salary) from employees);
select * from employees where salary = (select avg(salary) from employees where department_id = 1);
select * from employees where salary > (select avg(salary) from employees where department_id = (select department_id from employees where name = 'Rahul'));


-- multi row subqueries

select * from employees where department_id in (select department_id from employees where salary > 50000);
select * from employees where salary in (select salary from employees where department_id = 1);
select * from employees where department_id in (select department_id from employees where name in ('Rahul','Karthik'));
select * from employees where salary in (select salary from employees where department_id in (1,2));
select * from employees where department_id in (select department_id from employees where salary = (select max(salary) from employees));
select * from employees where salary > all (select salary from employees where department_id = 1);
select * from employees where salary < all (select salary from employees where department_id = 2);
select * from employees where salary > any (select salary from employees where department_id = 1);
select * from employees where salary < any (select salary from employees where department_id = 2);
select * from employees where department_id in (select department_id from employees where city = 'hyderabad');
select * from employees where salary in (select salary from employees where experience_level = 'senior');
select * from employees where department_id in (select department_id from employees where gender = 'female');
select * from employees where salary > all (select salary from employees where department_id in (1,2));
select * from employees where salary < all (select salary from employees where department_id in (2,3));
select * from employees where salary > any (select salary from employees where department_id in (1,2));
select * from employees where salary < any (select salary from employees where department_id in (2,3));
select * from employees where department_id in (select department_id from employees where salary > (select avg(salary) from employees));
select * from employees where salary in (select salary from employees where department_id in (select department_id from employees where city = 'hyderabad'));


-- multicolumn subqueries

select * from employees where (department_id,salary) = (select department_id,salary from employees where name = 'Rahul');
select * from employees where (department_id,salary) in (select department_id,salary from employees where name in ('Rahul','Karthik'));
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary > 50000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id = 1);
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id in (1,2));
select * from employees where (department_id,salary) in (select department_id,salary from employees where city = 'hyderabad');
select * from employees where (department_id,salary) in (select department_id,salary from employees where gender = 'female');
select * from employees where (department_id,salary) in (select department_id,salary from employees where experience_level = 'senior');
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary = (select max(salary) from employees));
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary = (select min(salary) from employees));


-- multirow in operator

select * from employees where department_id in (select department_id from employees where city = 'hyderabad');
select * from employees where department_id in (select department_id from employees where city = 'bangalore');
select * from employees where salary in (select salary from employees where department_id = 1);
select * from employees where salary in (select salary from employees where department_id = 2);
select * from employees where department_id in (select department_id from employees where gender = 'female');
select * from employees where department_id in (select department_id from employees where gender = 'male');
select * from employees where salary in (select salary from employees where experience_level = 'senior');
select * from employees where salary in (select salary from employees where experience_level = 'junior');
select * from employees where department_id in (select department_id from employees where salary > 50000);
select * from employees where department_id in (select department_id from employees where salary < 30000);


-- not in operator

select * from employees where department_id not in (select department_id from employees where city = 'hyderabad');
select * from employees where department_id not in (select department_id from employees where city = 'bangalore');
select * from employees where salary not in (select salary from employees where department_id = 1);
select * from employees where salary not in (select salary from employees where department_id = 2);
select * from employees where department_id not in (select department_id from employees where gender = 'female');
select * from employees where department_id not in (select department_id from employees where gender = 'male');
select * from employees where salary not in (select salary from employees where experience_level = 'senior');


-- any operator

select * from employees where salary > any (select salary from employees where department_id = 1);
select * from employees where salary < any (select salary from employees where department_id = 2);
select * from employees where salary >= any (select salary from employees where department_id = 3);
select * from employees where salary <= any (select salary from employees where department_id = 1);
select * from employees where salary = any (select salary from employees where department_id = 2);
select * from employees where salary <> any (select salary from employees where department_id = 3);
select * from employees where salary > any (select salary from employees where gender = 'female');


-- all operator

select * from employees where salary > all (select salary from employees where department_id = 1);
select * from employees where salary < all (select salary from employees where department_id = 2);
select * from employees where salary >= all (select salary from employees where department_id = 3);
select * from employees where salary <= all (select salary from employees where department_id = 1);
select * from employees where salary = all (select salary from employees where department_id = 2);
select * from employees where salary <> all (select salary from employees where department_id = 3);


-- multicolumn beginner

select * from employees where (department_id,salary) = (select department_id,salary from employees where name = 'Rahul');
select * from employees where (department_id,salary) = (select department_id,salary from employees where name = 'Karthik');
select * from employees where (department_id,salary) in (select department_id,salary from employees where city = 'hyderabad');
select * from employees where (department_id,salary) in (select department_id,salary from employees where city = 'bangalore');
select * from employees where (department_id,salary) in (select department_id,salary from employees where gender = 'female');
select * from employees where (department_id,salary) in (select department_id,salary from employees where gender = 'male');
select * from employees where (department_id,salary) in (select department_id,salary from employees where experience_level = 'senior');
select * from employees where (department_id,salary) in (select department_id,salary from employees where experience_level = 'junior');
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary > 50000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary < 30000);


-- multicolumn intermediate

select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id in (1,2));
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id in (2,3));
select * from employees where (department_id,salary) in (select department_id,salary from employees where city in ('hyderabad','bangalore'));
select * from employees where (department_id,salary) in (select department_id,salary from employees where city in ('chennai','mumbai'));
select * from employees where (department_id,salary) in (select department_id,salary from employees where gender = 'female' and salary > 50000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where gender = 'male' and salary > 50000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where experience_level = 'senior' and salary > 50000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where experience_level = 'junior' and salary < 30000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id = (select department_id from employees where name = 'Rahul'));
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id = (select department_id from employees where name = 'Karthik'));


-- multicolumn advanced

select * from employees where (department_id,salary) = (select department_id,salary from employees where name = 'Rahul');
select * from employees where (department_id,salary) = (select department_id,salary from employees where name = 'Karthik');
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary > (select avg(salary) from employees));
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary < (select avg(salary) from employees));
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary = (select max(salary) from employees));
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary = (select min(salary) from employees));
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id = (select department_id from employees where name = 'Rahul') and salary > (select salary from employees where name = 'Rahul'));
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id = (select department_id from employees where name = 'Karthik') and salary > (select salary from employees where name = 'Karthik'));
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id = (select department_id from employees where name = 'Rahul') and salary < (select salary from employees where name = 'Rahul'));
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id = (select department_id from employees where name = 'Karthik') and salary < (select salary from employees where name = 'Karthik'));
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id in (1,2) and salary > 50000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where department_id in (2,3) and salary < 50000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where city in ('hyderabad','bangalore') and salary > 50000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where city in ('chennai','mumbai') and salary < 50000);
select * from employees where (department_id,salary) in (select department_id,salary from employees where gender = 'female' and experience_level = 'senior');
select * from employees where (department_id,salary) in (select department_id,salary from employees where gender = 'male' and experience_level = 'senior');
select * from employees where (department_id,salary) in (select department_id,salary from employees where gender = 'female' and experience_level = 'junior');
select * from employees where (department_id,salary) in (select department_id,salary from employees where gender = 'male' and experience_level = 'junior');
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary > all (select salary from employees where department_id = 1));
select * from employees where (department_id,salary) in (select department_id,salary from employees where salary < all (select salary from employees where department_id = 2));
