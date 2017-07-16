import React from 'react';
import App from './App';
import { mount, shallow, render } from 'enzyme';

describe('<App />', () => {
  it('renders 1 <App /> component', () => {
    const wrapper = shallow(<App />);
    expect(wrapper).toHaveLength(1)
  });

  it('has 3 todos saved in state upon loading', () => {
    const wrapper = shallow(<App />);
    expect(wrapper.state().todos.length).toEqual(3)
  });
  describe('todo', () => {
    it('should have a name', () => {
      const wrapper = shallow(<App />);
      expect(wrapper.state().todos[0].name).toEqual('Learn JSX')
    })
  })
  describe('entering text to form', () => {
    it('should update the currentTodo state with its value', () => {
      const wrapper = shallow(<App />);
      const form = wrapper.find('input[type="text"]');
      form.simulate('change', {target: {value: 'test'}});
      expect(wrapper.state().currentTodo).toEqual('test')
    })
  })
});
