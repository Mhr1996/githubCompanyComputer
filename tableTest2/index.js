import React from 'react';
import ReactDOM from 'react-dom';
import './src/sass/index.scss';
import Reactfrom from './src/reactfrom/reactfrom';
import MessageBook from './src/messageBook/messageBook';

class Table extends React.Component{
	render(){
		return(
			<div>
				<a href="http://www.baidu.com">{this.props.name}</a>
			</div>
		)
	}
}

class Dv extends React.Component{
	render(){
		return(
			<div>
				<Table name="Hello World!"/>
			</div>
		)
	}
}

ReactDOM.render(<div><Table /><Reactfrom /><MessageBook /></div>, document.getElementById("app"))
