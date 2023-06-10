create database projects;

use projects;

select * from hr;

# Renaming the ID column

alter table hr
change column ï»¿id emp_id VARCHAR(20) NULL;

DESCRIBE hr;


select birthdate from hr;

set sql_safe_updates = 0;

update hr
set birthdate = CASE
	when birthdate like '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
    when birthdate like '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
    else NULL
    end;
    
alter table hr
modify column birthdate date;
    
select birthdate from hr;

update hr
set hire_date = CASE
	when hire_date like '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
    when hire_date like '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
    else NULL
    end;
    
alter table hr
modify column hire_date Date;

describe hr;

update hr
set termdate = if(termdate is not null and termdate != '',date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC')),'0000-00-00')
where true;

select termdate from hr;

set sql_mode = 'ALLOW_INVALID_DATES';

alter table hr
modify column termdate Date;


alter table hr add column age INT;

select * from hr;


update hr 
set age = timestampdiff(YEAR,birthdate,CURDATE());

select birthdate,age from hr;

select MIN(age) as youngest,
	   max(age) as oldest
from hr;

select count(*) from hr where age<18;


