import React from 'react';
import App from '../App';
import {TodoForm} from '../components/todo/TodoForm'
import { mount, shallow, render } from 'enzyme';

describe('<App />', () => {
  it('renders 1 <App /> component', () => {
    const wrapper = shallow(<App />);
    expect(wrapper).toHaveLength(1)
  });

  it('has a todos saved in state upon loading', () => {
    const wrapper = shallow(<App />);
    expect(wrapper.state().todos.length).toEqual(1)
  });
  describe('todo', () => {
    it('should have a name', () => {
      const wrapper = shallow(<App />);
      expect(wrapper.state().todos[0].name).toEqual('Learn react')
    })
  })
  describe('entering a new todo', () => {
    it('should add the todo to the list', () => {
      const wrapper = shallow(<App />);
      const form = wrapper.find('.todo-form');
      const event = {target: {value: 'test'}};
      form.simulate('submit', event);
      expect(wrapper.state().todos.length).toEqual(2)
    })
  })
});
