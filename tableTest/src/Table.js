import React from 'react';

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
				<Table name="Hello World"/>
			</div>
		)
	}
}

export default Dv;