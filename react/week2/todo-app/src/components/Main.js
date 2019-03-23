import React, { Component } from "react";
import Todos from "./Todos";
import AddTodo from "./AddTodo";

export default class Main extends Component {
  state = {
    todos: [
      {
        id: 1,
        description: "Get out of bed",
        done: true
      },
      {
        id: 2,
        description: "Brush teeth",
        done: false
      },
      {
        id: 3,
        description: "Eat breakfast",
        done: false
      }
    ]
  };

  deleteTodo = id => {
    const todos = this.state.todos.filter(todo => {
      return todo.id !== id;
    });
    this.setState({ todos });
  };
  editTodo=id=>{

  }
  toggleTodo = id => {
    const todos = this.state.todos.map((todo) => {
        if(todo.id===id){
            todo.done=!todo.done
        }
        return todo
      });
    this.setState({todos});
  };

  
  addTodo = todo => {
    todo.id = Math.random();
    const todos = [...this.state.todos, todo];
    this.setState({ todos });
  };

  render() {
    return (
      <div className="container">
        <AddTodo addTodo={this.addTodo} />
        <Todos
          todos={this.state.todos}
          deleteTodo={this.deleteTodo}
          toggleTodo={this.toggleTodo}
        />
      </div>
    );
  }
}
