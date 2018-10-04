import React from 'react';
import ReactDOM from 'react-dom';
import './src/sass/index.scss';
import Reactfrom from './src/reactfrom/reactfrom';
import MessageBook from './src/messageBook/messageBook';
import ReactContext from './src/reactContext/reactContext';

import ModifyColor from './src/modifyColor/modifyColor';
import Timer from './src/timer/timer';

class Table extends React.Component{
	constructor(props){
		super(props);
	}
	render(){
		return(
			<div>
				<a id="one" href="http://www.baidu.com">{this.props.name}</a>
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

class C extends React.Component{
	render(){return(<div> <p>{this.props.name}******** {this.props.age} ********{this.props.sex}</p> </div> ) }
}

class B extends React.Component{
	render(){return(<div> <C {...this.props}/> </div> ) }
}

class A extends React.Component{
	render(){return(<div> <B {...this.props}/> </div> ) }
}

class Control extends React.Component{
	render(){
		return(
			<div className="project">
			 	<ul>
					<li><h2>案例1</h2><Dv /></li>
					<li><h2>案例2</h2><Reactfrom /></li>
					<li><h2>案例3</h2><MessageBook /></li>
					<li><h2>案例4</h2><ReactContext /></li>
				</ul>
				<ul>
					<li><h2>案例5</h2><ModifyColor /></li>
					<li><h2>案例6</h2><A  name="小明" age="102" sex="男"/></li>
					<li><h2>案例6</h2><Timer /></li>
				</ul>
			</div>
		)
	}
}
ReactDOM.render(
	<Control />, 
	document.getElementById("app")
)
