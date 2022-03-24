--task1  (lesson2)
-- oracle: https://leetcode.com/problems/department-top-three-salaries/
select Department,Employee, Salary from (
select d.name Department, e.name Employee, salary Salary, 
dense_rank() over (partition by d.name order by salary desc) rank
from Employee e join Department d on e.departmentId = d.id
where d.name = 'IT' 
union 
select d.name Department, e.name Employee, salary Salary, 
dense_rank() over (partition by d.name order by salary desc) rank
from Employee e join Department d on e.departmentId = d.id
where d.name = 'Sales' ) g
where rank < 4

--task2  (lesson2)
-- https://sql-academy.org/ru/trainer/tasks/17

select member_name,status,sum(amount) 
from Payments p join FamilyMembers f on p.family_member = f.member_id
group by member_name, status

--task3  (lesson2)
-- https://sql-academy.org/ru/trainer/tasks/13
select name from (
select name, row_number() over (partition by name) r
from Passenger ) m
where r > 1

--task4  (lesson2)
-- https://sql-academy.org/ru/trainer/tasks/38
SELECT count(*) as count from Student
where first_name = 'Anna'

--task5  (lesson2)
-- https://sql-academy.org/ru/trainer/tasks/35
SELECT distinct count(classroom) as count 
from Schedule
where date = '2019-09-02'

--task6  (lesson2)
-- https://sql-academy.org/ru/trainer/tasks/38
SELECT count(*) as count from Student
where first_name like 'Anna'

--task7  (lesson2)
-- https://sql-academy.org/ru/trainer/tasks/32
select FLOOR(age) age from (
SELECT avg(extract(year from date)-extract(year from birthday)) as age 
from FamilyMembers f join Payments p on f.member_id=p.family_member
) m
--task8  (lesson2)
-- https://sql-academy.org/ru/trainer/tasks/27
SELECT good_type_name,sum(amount) 
from GoodTypes gt join Goods g on gt.good_type_id=g.type 
join Payments p on g.good_id=p.good
where extract(year from date) = '2005'
group by 1
--task9  (lesson2)
-- https://sql-academy.org/ru/trainer/tasks/37
 SELECT max(YEAR(DATE)) - (select max(YEAR(birthday)) from Student )  year
 from Schedule
--task10  (lesson2)
-- https://sql-academy.org/ru/trainer/tasks/44

--task11 (lesson2)
-- https://sql-academy.org/ru/trainer/tasks/20
select status,member_name,sum(unit_price * amount) costs
from FamilyMembers f 
join Payments p on f.member_id = p.family_member
where good in (
select good_id from Goods g join GoodTypes gt on g.type = gt.good_type_id
where good_type_name = 'entertainment') 
GROUP BY  member_name,status
--task12  (lesson2)
-- https://sql-academy.org/ru/trainer/tasks/55
DELETE FROM Company WHERE id in (select company from (
select company , count(* ) c from Trip
GROUP BY company 
HAVING c = 2 ) h )
--task13  (lesson2)
-- https://sql-academy.org/ru/trainer/tasks/45
SELECT classroom from (
SELECT classroom ,COUNT(number_pair) d
from Schedule 
group by classroom 
order by d desc
limit 2) l 

--task14  (lesson2)
-- https://sql-academy.org/ru/trainer/tasks/43
SELECT last_name 
from Teacher t  join Schedule s on s.teacher = t.id
join Subject su on s.subject = su.id
where name like '%Physical%'
order by last_name
--task15  (lesson2)
-- https://sql-academy.org/ru/trainer/tasks/63
select CONCAT(last_name,'.',SUBSTRING(first_name,1,1),'.',SUBSTRING(middle_name,1,1) ,'.' ) name from Student
order by name