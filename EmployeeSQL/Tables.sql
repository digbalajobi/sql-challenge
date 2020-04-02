create table employees (
emp_no int primary key not null,
birth_date varchar(30),
first_name varchar(30),
last_name varchar(30),
gender varchar(5),
hire_date varchar(30));

create table departments (
dept_no varchar(30) primary key not null,
dept_name varchar(30) not null);

create table dept_emp (
emp_no int not null,
foreign key (emp_no) references employees(emp_no),
dept_no varchar(30) not null,
foreign key (dept_no) references departments(dept_no),
from_date varchar(30),
to_date varchar(30));

create table dept_manager (
dept_no varchar(30) not null,
foreign key (dept_no) references departments(dept_no),
emp_no int not null,
foreign key (emp_no) references employees(emp_no),
from_date varchar(30),
to_date varchar(30));

create table salaries (
emp_no int not null,
foreign key (emp_no) references employees(emp_no),
salary int not null,
from_date varchar(30),
to_date varchar(30));

create table titles (
emp_no int not null,
foreign key (emp_no) references employees(emp_no),
title varchar(50) not null,
from_date varchar(30),
to_date varchar(30));
