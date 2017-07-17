import React from 'react';
import {TodoForm} from '../components/todo/TodoForm'
import { mount, shallow, render } from 'enzyme';
import sinon from 'sinon';

describe('<TodoForm />', () => {
  it('should render one <TodoForm/> element', () => {
    const wrapper = shallow(<TodoForm />);
    expect(wrapper.find('input').length).toEqual(1)
  });
  it('simulates input change events', () => {
    const handleInputChange = sinon.spy();
    const wrapper = shallow(<TodoForm handleInputChange= {handleInputChange} />);
    wrapper.find('input').simulate('change');
    expect(handleInputChange.calledOnce).toEqual(true);
  })
  it('simulates submit events', () => {
    const handleSubmit = sinon.spy();
    const wrapper = shallow(<TodoForm handleSubmit= {handleSubmit} />);
    wrapper.find('form').simulate('submit');
    expect(handleSubmit.calledOnce).toEqual(true);
  })
});
