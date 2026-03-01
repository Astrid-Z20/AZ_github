# Write your MySQL query statement below
with existing_emp as(
    select employee_id from Employees
)
select employee_id from Employees
where salary < 30000 and manager_id is not null and manager_id not in (select employee_id from existing_emp)
order by employee_id;