import React, { Component } from 'react';
import './App.css';
import {TodoForm, TodoList} from './components/todo/'
import {addTodo ,generateId} from './lib/todoHelpers'

class App extends Component {
  constructor(){
    super()
    this.state ={
      todos: [
        {id: 1, name: 'Learn react', isComplete: true}
      ],
      currentTodo: ''
    }
    this.handleInputChange = this.handleInputChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleSubmit(e) {
    e.preventDefault()
    const newId = generateId(this.state.todos.length)
    const newTodo = {id: newId, name: this.state.currentTodo, isComplete: false}
    const updatedTodos = addTodo(this.state.todos, newTodo)
    this.setState({
      todos: updatedTodos,
      currentTodo: ''
    })
  }

  handleInputChange (e) {
    this.setState({
      currentTodo: e.target.value
    })
  }

  render() {
    return (
      <div className="App">
        <div className="App-header">
        </div>
        <div className="Header-title"><h2>Todo List</h2></div>
        <div className="Todo-App">
          <TodoForm className="todo-form" handleInputChange={this.handleInputChange}
          currentTodo={this.state.currentTodo}
          handleSubmit={this.handleSubmit}/>
          <TodoList todos={this.state.todos}/>
        </div>
      </div>
    );
  }
}

export default App;
