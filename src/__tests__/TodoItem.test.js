import React from 'react';
import {TodoItem} from '../components/todo/TodoItem'
import { mount, shallow, render } from 'enzyme';
import sinon from 'sinon';

describe('<TodoItem />', () => {
  it('should render one TodoItem', () => {
    const todo = sinon.spy()
    const wrapper = shallow(<TodoItem {...todo}/>);
    expect(wrapper.find('li').length).toEqual(1)
  });
});
