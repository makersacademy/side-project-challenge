import React from 'react';
import App from '../App';
import {TodoForm} from '../components/todo/TodoForm'
import { mount, shallow, render } from 'enzyme';

describe('<App />', () => {
  it('renders 1 <App /> component', () => {
    const wrapper = shallow(<App />);
    expect(wrapper).toHaveLength(1)
  });
});
