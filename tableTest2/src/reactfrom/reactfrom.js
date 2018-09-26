import React from 'react';

class Reactfrom extends React.Component{
	constructor(props){
		super(props);

		this.state={
			value:'请填写留言'
		}
		this.modeifyValue=this.modeifyValue.bind(this);
		this.submitFrom=this.submitFrom.bind(this);
	}
	modeifyValue(e){
		this.setState({
			value:e.target.value
		})
	}
	submitFrom(){
		alert(this.state.value);
	}
	render(){
		return(
			<div>
				<p>留言</p>
				<input type="text" onChange={this.modeifyValue} value={this.state.value}/>
				<button onClick={this.submitFrom}>提交</button>
			</div>
		)
	}
}

export default Reactfrom