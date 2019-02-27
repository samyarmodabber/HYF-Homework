select * from user;
show tables;
select * from task;
select * from status;
select * from task where status_id =2;
select * from task where title like "%wash%";
select * from task where title like "%wash%" limit 1,2;
select * from task where due_date is null;
select * from user order by name;
select * from user order by phone desc;
select email from task ; /*Make ERROR*/


describe user;



select * from task;
select * from status;
select * from task join status;
select * from task join status on task.status_id=status.id;
select task.* from task join status on task.status_id=status.id;

select * from task join status on task.status_id=status.id where status.name="In progress";
select * from user;
select * from task;
select * from task join user on task.user_id=user.id where user.name LIKE "%Pab_o%";

select count(id) from task;

select user.name , count(task.id) from task join user on task.user_id=user.id group by user.id;
select user.name , count(task.id) 
from task join user on task.user_id=user.id 
where user.name like "Pab%" or user.name like "Ro%"
group by user.id;


select max(created) from task;

/* HW*/
select * from status;
/*Find out how many tasks are in the task table*/
select count(*) from task ;
/*Find out how many tasks in the task table do not have a valid due date*/
select count(*) from task where task.due_date is null;
/*Find all the tasks that are marked as done*/
select * from task join status on task.status_id=status.id where status.name="Done";
/*Find all the tasks that are not marked as done*/
select * from task join status on task.status_id=status.id where not status.name="Done";
/*Get all the tasks, sorted with the most recently created first*/
select * from task order by created desc;
/*Get the single most recently created task*/
select * from task order by created desc limit 1;
/*Get the title and due date of all tasks where the title or description contains database*/
select title , due_date from task where task.title is not null or task.description is not null;
/*Get the title and status (as text) of all tasks*/
select task.title , status.name from task join status on task.status_id=status.id; 
/*Get the name of each status, along with a count of how many tasks have that status*/
select status.name, count(status.name) from status join task on status.id=task.status_id group by status.id;
/*Get the names of all statuses, sorted by the status with most tasks first*/
select status.name from status join task on status.id=task.status_id group by status.id order by count(status.name) desc;


