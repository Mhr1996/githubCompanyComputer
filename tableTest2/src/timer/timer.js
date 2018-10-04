import React from 'react';

class Timer extends React.Component{
	constructor(props){
		super(props);

		this.state={
			time:0
		}

	}

	componentDidMount(){
		setInterval(()=>this.setState({
			time:this.state.time+100
		}),1000);
	}
	render(){
		return(
			<div>
				{this.state.time}
			</div>
		)
	}
}

export default Timer;