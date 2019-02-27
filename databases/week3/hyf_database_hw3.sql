create database hyf_database_hw3;
set character  set utf8;
use hyf_database_hw3;

create table class(
	id int(10) unsigned not null,
	name varchar(255),
	begins date,
     ends date,
     primary key(id)
);


create table student(
	id int(10) unsigned not null,
	name varchar(255),
	email varchar(255),
     phone varchar(255),
     class_id int unsigned,
     primary key (id),
     foreign key (class_id) references class(id)
);

create index idx_studentName on student (name);

alter table class add column status enum('not-started', 'ongoing', 'finished');

/*It should not work by start for status */
/*insert into class (id,name,begins,ends,status) values(11, 'class07','2019-02-17','2019-03-30', 'statrt');
*/

insert into class (id,name,begins,ends,status) values(1,'class07','2019-02-17','2019-03-30', 'ongoing');

select * from class;