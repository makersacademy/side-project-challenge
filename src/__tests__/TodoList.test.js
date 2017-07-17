import React from 'react';
import {TodoList} from '../components/todo/'
import { mount, shallow, render } from 'enzyme';
import sinon from 'sinon';

describe('<TodoList />', () => {
  it('should render one <TodoList/> element', () => {
    const todo = {id: 1, name: "test", isComplete: false}
    const todos = sinon.stub([todo])
    const wrapper = shallow(<TodoList todos={todos}/>);
    expect(wrapper.find('ul').length).toEqual(1)
  });
});
