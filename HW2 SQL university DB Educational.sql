create database university_db; /* University Database - Educational Part*/
SET CHARACTER SET utf8;

create table roles(
	 ID int(10) unsigned not null,
	 name varchar(255),
	 description varchar(255),
     primary key (ID)
);

create table users (
    ID int(10) unsigned not null auto_increment,
    email varchar(225) not null,    
    username varchar(255) ,	
    password varchar(255),
    roleID int(10) unsigned,
    nationalID int(10),
	title varchar(255),
    firstName varchar(255),
	middleName varchar(255),
	lastName varchar(255),
	fatherName varchar(255),
	sex varchar(255),
	birthDate datetime ,
	birthPlace varchar(255),
    address varchar(255),
    city varchar(255),
    country varchar(225),	
    phone int(20),
    mobile int(20),
	photo_url varchar(255),
    created datetime default now(),
	updated datetime default now(),
    foreign key (roleID) references roles(ID), 
    primary key (ID)
);

create unique index idx_nationalID on users (nationalID);

create table places(
	ID int(10) unsigned not null,
    description varchar(255),
    floor int(10),
    number varchar(255),
	street varchar(255),
    city varchar(255),
    province varchar(255),
    country varchar(255),
    capacity int(10),
    size_sq_2 int(10),
    primary key (ID)
);

create table contacts(
	ID int(10) unsigned not null,
    phone varchar(255),
    email varchar(255),
    isActive boolean default true,
    primary key (ID)
);

create table university(
	ID int(10) unsigned not null, /* In the case of universities with branches*/
	name varchar(255),
    description varchar(255),
	deanID int(10) unsigned,
	placeID int(10) unsigned,
	contactID int(10) unsigned,
    foreign key (deanID) references users(ID),
    foreign key (placeID) references places(ID),
    foreign key (contactID) references contacts(ID),
	primary key (ID)
);

create table faculties(
	ID int(10) unsigned not null,
	name varchar(255),
	description varchar(255),
	placeID int(10) unsigned,
	contactID int(10) unsigned,
	deanID int(10) unsigned,	
	foreign key (placeID) references places(ID),
    foreign key (contactID) references contacts(ID),
    foreign key (deanID) references users(ID),
    primary key (ID)
);

create table departments(
	ID int(10) unsigned not null,
	name varchar(255),
    description varchar(255),
	placeID int(10) unsigned,
	contactID int(10) unsigned,
	facultyID int(10) unsigned,
	deanID int(10) unsigned,
    foreign key (placeID) references places(ID),
    foreign key (contactID) references contacts(ID),
    foreign key (facultyID) references faculties(ID),
    foreign key (deanID) references users(ID),
    primary key (ID)
);

create table classes(
	ID int(10) unsigned not null,
    name varchar(255),
    description varchar(255),
	placeID int(10) unsigned,
    foreign key (placeID) references places(ID),
    primary key (ID)
);

create table level_of_studies(
    ID int(10) unsigned not null,
	isGraduate boolean,
	name varchar(255),	/*(Diploma, BS, MS, PhD)*/
    primary key (ID)
);

create table majors(
	ID int(10) unsigned not null,
	name varchar(255),
    description varchar(255),
	placeID int(10) unsigned,
    facultyID int(10) unsigned,
	departmentID int(10) unsigned,
	deanID int(10) unsigned,
	levelofStudyID int(10) unsigned,
    foreign key (placeID) references places(ID),
    foreign key (facultyID) references faculties(ID),
    foreign key (departmentID) references departments(ID),
    foreign key (deanID) references users(ID),
    foreign key (levelOfStudyID) references level_of_studies(ID),
    primary key (ID)
);

/*
		Employees PART (includes STAFFS and PRPFESSORS)
*/
create table employee_types(
    ID int(10) unsigned not null,
	name varchar(255), /*(part-time, full-time, guest) for all employees*/
    hoursPerWeek int(10),
    primary key (ID)
);

create table professor_ranks (
    ID int(10) unsigned not null,
	name varchar(255), /*(lecturer, assistant professor, associate professor, full professor) for professors*/
    primary key (ID)
);

create table staff_roles(
    ID int(10) unsigned not null,
    name varchar(255),
    level int(10),
    primary key (ID)
    /*  deans and staffs' role of university, faculty, department , Board of Trustees  */
);

create table staffs(
    ID int(10) unsigned not null auto_increment,
	userID int(10) unsigned,
    roleID int(10) unsigned,
	departmentID int(10) unsigned,
	employeeTypeID int(10) unsigned,
    foreign key (userID) references users(ID),
    foreign key (roleID) references staff_roles(ID),
    foreign key (departmentID) references departments(ID),
    foreign key (employeeTypeID) references employee_types(ID),
    primary key (ID)
);

create table professors(
    ID int(10) unsigned not null auto_increment,
	userID int(10) unsigned,
	rankID int(10) unsigned,
	departmentID int(10) unsigned,
    facultyID int(10) unsigned,
	employeeTypeID int(10) unsigned,
    foreign key (userID) references users(ID),
    foreign key (rankID) references professor_ranks(ID),
    foreign key (departmentID) references departments(ID),
    foreign key (facultyID) references faculties(ID),
    foreign key (employeeTypeID) references employee_types(ID),
    primary key (ID)
);


/*
		STUDENTS PART
*/
create table st_statuses(
    ID int(10) unsigned not null,
    name varchar(255), /*current, graduate, abandon, rejected , conditional*/
    primary key (ID)
);

create table students(
    ID int(10) unsigned not null auto_increment,
	studentNumber int(10),
	userID int(10) unsigned,
    stStatusID int(10) unsigned,
	majorID int(10) unsigned,
	levelOfStudyID int(10) unsigned,
    foreign key (userID) references users(ID),
    foreign key (stStatusID) references st_statuses(ID),
    foreign key (majorID) references majors(ID),
    foreign key (levelOfStudyID) references level_of_studies(ID),
    primary key (ID)
);


/*
	******************  MODULES PART ***********************
*/


create table module_types(
	ID int(10) unsigned not null,
	name varchar(255), /*Project, Theoretical, Practical, Theoretical-Practical, final Project*/
    primary key (ID)
);
	
create table module_groups (
	ID int(10) unsigned not null,
	name varchar(255),  /*main, selected*/
    primary key (ID)
);

create table modules(
	ID int(10) unsigned not null auto_increment,
    name varchar(255),
	moduleTypeID int(10) unsigned,
	moduleGroupID int(10) unsigned,
	credits int(10),
    foreign key (moduleTypeID) references module_types(ID),
    foreign key (moduleGroupID) references module_groups(ID),
    primary key (ID)
);

create table study_plan(
	moduleID int(10) unsigned,
    majorID int(10) unsigned,
    foreign key (moduleID) references modules(ID),
    foreign key (majorID) references majors(ID)
);


create table pre_modules(
	moduleID int(10) unsigned,
    preModuleID int(10) unsigned,
    foreign key (moduleID) references modules(ID),
	foreign key (preModuleID) references modules(ID)
);

/*
   ************ SEMESTERS**********
*/
create table seasons(
	ID int(10) unsigned not null,
    name varchar(255),
    primary key (ID)
);

create table semesters(
	ID int(10) unsigned not null auto_increment, 
	academicYear year,
	seasonID int(10) unsigned,
    startRegister datetime,
	endRegister datetime,
	startSemester date,	
    startCourses date,
	endCourses date,
	startExam date,
	endExam date,
    endSemester date,
    foreign key (seasonID) references seasons(ID),
    primary key (ID)
);

create table exam_roles(
	ID int(10) unsigned not null,
    role_name varchar(255),
    description varchar(255),
    primary key (ID)
);

create table exam_staff(
	semesterID int(10) unsigned,
	staffID int(10) unsigned,
    examRoleID int(10) unsigned,
    foreign key (semesterID) references semesters(ID),
    foreign key (staffID) references staffs(ID),
    foreign key (examRoleID) references exam_roles(ID)
);

create table days(
 ID int(10) unsigned not null,
 day varchar(255),
 primary key (ID)
);

create table times(
	ID int(10) unsigned not null,
	startTime time,
	endTime time,
	primary key (ID)
);

create table course_types(
	ID int(10) unsigned not null,
    typeName varchar(255), /*online, self_study , class, search */
	description varchar(255),
    primary key (ID)
);

create table courses(
	ID int(10) unsigned not null ,
	semesterID int(10) unsigned,
	moduleID int(10) unsigned,
	classID int(10) unsigned,
    courseTypeID int(10) unsigned,
	minimumCapacity int(10),
	maximumCapacity int(10),
	currentCapacity int(10),
    courseURL varchar(255),
	foreign key (semesterID) references semesters(ID),
    foreign key (moduleID) references modules(ID),
    foreign key (classID) references classes(ID),
    foreign key (courseTypeID) references course_types(ID),
    primary key (ID)
);


create table course_day_time(
	courseID int(10) unsigned,
    dayID int(10) unsigned,
    timeID int(10) unsigned,
    foreign key (courseID) references courses(ID),
    foreign key (dayID) references days(ID),
    foreign key (timeID) references times(ID)
);

create table course_professor (
	courseID int(10) unsigned,
    professorID int(10) unsigned,
    foreign key (courseID) references courses(ID),
    foreign key (professorID) references professors(ID)
);

create table exam_statuses(
	ID int(10) unsigned not null,
	statusName varchar(255), /*(pass, fail, delete, absent)*/
	primary key (ID)
);

create table transcripts(
	ID int(10) unsigned not null auto_increment,
	courseID int(10) unsigned,
	studentID int(10) unsigned,
	grade int(10) unsigned, /* Depend on the system grade*/
	examStatusID int(10) unsigned,	
    foreign key (courseID) references courses(ID),
    foreign key (studentID) references students(ID),
    foreign key (examStatusID) references exam_statuses(ID),
    primary key (ID)
);

create table certificates(
	ID int(10) unsigned not null auto_increment,
	studentID int(10) unsigned,
	majorID int(10) unsigned,
    overalGrade int(10) unsigned,
    graduateDate date,
	foreign key (majorID) references majors(ID),
    foreign key (studentID) references students(ID),
    primary key (ID)
);


