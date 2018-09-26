import React from 'react';
import ReactDOM from 'react-dom';
import './src/sass/index.scss';
import Reactfrom from './src/reactfrom/reactfrom';

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

<<<<<<< HEAD
ReactDOM.render(<Dv />, document.getElementById("app"))
=======
ReactDOM.render(<div><Template /><Reactfrom /></div>, document.getElementById("app"))
>>>>>>> 9c15f704d2fbdecbeff10d0257f5c8ddf27c317b
