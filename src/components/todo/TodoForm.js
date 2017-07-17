import React from 'react'

export const TodoForm = (props) => (
  <form onSubmit={props.handleSubmit}>
    <input type="text"
    onChange={props.handleInputChange}
    value={props.currentTodo}/>
  </form>)
