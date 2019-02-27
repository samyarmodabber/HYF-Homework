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


