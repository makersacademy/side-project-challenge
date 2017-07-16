import {addTodo, generateId} from '../lib/todoHelpers'

describe('addTodo', () => {
  it('should add an item to the todo array', () =>{
    const startTodos = [
      {id:1, name: 'one', isComplete: false},
      {id:2, name: 'two', isComplete: false}
    ]
    const newTodo = {id:3, name: 'three', isComplete: false}
    const expected = [
      {id:1, name: 'one', isComplete: false},
      {id:2, name: 'two', isComplete: false},
      {id:3, name: 'three', isComplete: false}
    ]
    const result = addTodo(startTodos, newTodo)

    expect(result).not.toBe(startTodos)
  })
})

describe('generateId', () => {
  it('return the next number', () =>{
    const num = 1
    const expected = 2
    const result = generateId(num)

    expect(result).toEqual(expected)
  })
})
