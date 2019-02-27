var mysql = require("mysql");
const config = require("./config");
const db = mysql.createConnection(config);

db = connection.connect();

/**
 * @author Samyar Modabber
 * @description Homework HYF
 */


const addNewTask = function(
    title,
    description,
    created,
    updated,
    dueDate,
    statusID,
    userID
  ) {
    const insert_task =
      "insert into task (title, description, created, updated, due_date, status_id)  values (?,?,?,?,?,?)";
    const task = [title, description, created, updated, dueDate, statusID];
    db.beginTransaction(err => {
      if (err) throw err;
      db.query(insert_task, task, (err, result) => {
        if (err) db.rollback(() => {throw err});
        const insert_user_task =
          "insert into user_task (user_id,task_id) values(?,?)";
        const user_task = [userID, result.insertId];
        db.query(insert_user_task, user_task, (err, result) => {
          if (err) db.rollback(() => {throw err});
          db.commit(err => {
            if (err) db.rollback(() => {throw err});
          });
          console.log(result.affectedRows + " record(s) added");
          db.end();
          return result;
        });
      });
    });
  };

// addNewTask(
//   "Film",
//   "Didan Film ",
//   "2017-10-25 06:54:16",
//   "2017-10-25 06:54:16",
//   "2019-01-09",
//   2,
//   13
// );

const changeTaskTitle = function(taskID, newTitle) {
  const qs = `update task set title = ? where id = ?`;
  db.query(qs, [newTitle, taskID], function(err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });
};

// changeTaskTitle(36, "new title");

const changeTaskDueDate = function(taskID, newDueDate) {
  const qs = `update task set due_date = ? where id = ?`;
  db.query(qs, [newDueDate, taskID], function(err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });
};

// changeTaskDueDate(36,'2019-01-20');

const changeTaskStatus = function(taskID, newStatus) {
  const qs = `update task set status_id = ? where id = ?`;
  db.query(qs, [newStatus, taskID], function(err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });
};

// changeTaskStatus(36,1);

const markTaskAsCompleted = function(taskID) {
  const qs = `update task set status_id = 3 where id = ?`;
  db.query(qs, taskID, function(err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });
};

// markTaskAsCompleted(36);

const deleteTask = function(taskID) {
  const qs = `delete from task where id = ?`;
  db.query(qs, taskID, function(err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) deleted");
  });
};

// deleteTask(37);

const deleteUser = userID => {
  const qs = `delete from user where id = ?`;
  db.query(qs, userID, function(err, result) {
    if (err) throw err;
    console.log(result);

    console.log(result.affectedRows + " record(s) deleted");
  });
};

// deleteUser(13);

db.end();
