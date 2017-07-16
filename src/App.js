import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  constructor(){
    super()
    this.state ={
      todos: [
        {id: 1, name: 'Learn JSX', isComplete: true},
        {id: 2, name: 'TDD', isComplete: false},
        {id: 3, name: 'Make something', isComplete: false}
      ],
      currentTodo: ''
    }
    this.handleInputChange = this.handleInputChange.bind(this)
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
          <img src={logo} className="App-logo" alt="logo" />
          <h2>React Todos</h2>
        </div>
        <div className="Todo-App">
          <form>
            <input className="newtodo" type="text" onChange={this.handleInputChange} value={this.state.currentTodo}/>
          </form>
          <div className="todo-list">
            <ul>
              {this.state.todos.map(todo =>
                <li key={todo.id}>
                  <input type="checkbox" defaultChecked={todo.isComplete}/>{todo.name}
                </li>)}
            </ul>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
