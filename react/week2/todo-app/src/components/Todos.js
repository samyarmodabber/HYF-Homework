import React from "react";
import "./Todo.css";

export default function Todos({ todos, deleteTodo,toggleTodo }) {
  const allTodos = todos.length ? (
    todos.map(todo => {
      let className=''
      if (todo.done) {
        className += ' isDone';
      }
      return (
        <div key={todo.id} className="todo_item">
          <input type="checkBox" onClick={()=>{toggleTodo(todo.id)}} checked={todo.done} />
          <div className={className}>{todo.description}</div>
          <span onClick={() => {deleteTodo(todo.id);}} id='delete'> Delete </span>
        </div>
      );
    })
  ) : (
    <h2> No items... </h2>
  );
  return <div className="container">{allTodos}</div>;
}
