import React from 'react';

class AddNumber extends React.Component{
	constructor(props){
		super(props);
		this.state={
			num:0
		}
		this.addNum = this.addNum.bind(this)
	}
	
	addNum(){
		this.setState({
			num: this.state.num+1
		})
	}
	render(){
		return(
			<div style={{fontSize:"80px"}}>
				{this.state.num}
				<button onClick={this.addNum}>+</button>
			</div>
		)
	}
}

export default AddNumber;