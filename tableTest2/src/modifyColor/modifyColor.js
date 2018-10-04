import React from 'react';
import '../sass/modifyColor.scss';

class ModifyColor extends React.Component{
	constructor(props){
		super(props);
		this.state={
			bc:{backgroundColor:'#999999'}
		}
		this.color=this.color.bind(this)
	}
	color(e){
		if(/^\S{1}\d{6}|^\w/.test(e.target.value)){
			this.setState({
				bc:{backgroundColor:e.target.value}
			})
		}
	}
	render(){
		return(
			<div className="MC">
				<div style={this.state.bc}>颜色区域</div>
				<input type="text" placeholder="代码值填写" onChange={this.color}/>
			</div>
		)
	}
}

export default ModifyColor;