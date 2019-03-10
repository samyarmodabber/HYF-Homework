import React from "react";
import "./Todos.css";

export default function Todos({ todos, deleteTodo,toggleTodo,updateTodo ,isEditting }) {
  const allTodos = todos.length ? (
    todos.map(todo => {
      return (
        <div key={todo.id} className="todo_item">
          <input type="checkBox" onClick={()=>{toggleTodo(todo.id)}} checked={todo.done} />
          {isEditting?(
              <input type='text' value={todo.description} onChange={updateTodo}></input>
          
            ):(
              <div className={todo.done?"isDone":""} >{todo.description} </div>
          )}
          <div onClick={updateTodo} className='btn'> Update </div>
          <span onClick={() => {deleteTodo(todo.id);}} className='btn'> Delete </span>
        </div>
      );
    })
  ) : (
    <h2> No items... </h2>
  );
  return <div className="container">{allTodos}</div>;
}
