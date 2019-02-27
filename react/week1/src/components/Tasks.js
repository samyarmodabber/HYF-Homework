import React, { Component } from "react";
import Task from "./Task";

export default class Tasks extends Component {
  handleStart = (event, ui) => {
    console.log("Event: ", event);
    console.log("Position: ", ui.position);
  };
  handleDrag = (event, ui) => {
    console.log("Event: ", event);
    console.log("Position: ", ui.position);
  };
  handleStop = (event, ui) => {
    console.log("Event: ", event);
    console.log("Position: ", ui.position);
  };

  render() {
    const allTasks = [
      {
        id: 1,
        title: "Get out of bed",
        date: "Wed Sep 13 2017"
      },
      {
        id: 2,
        title: "Brush teeth",
        date: "Thu Sep 14 2017"
      },
      {
        id: 3,
        title: "Eat breakfast",
        date: "Fri Sep 15 2017"
      }
    ];
    return (
      <div>
        <p>All task:</p>
        {allTasks.map(task => (
          <Task key={task.id} title={task.title} date={task.date} />
        ))}
      </div>
    );
  }
}
