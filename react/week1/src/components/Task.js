import React, { Component } from "react";

export default class Task extends Component {
  render() {
    const { title, date } = this.props;

    return (
      <div>
        <div>
          <div className="taskRow">
            <h2>{title}:</h2>
            <h3>{date}</h3>
          </div>
        </div>
      </div>
    );
  }
}
