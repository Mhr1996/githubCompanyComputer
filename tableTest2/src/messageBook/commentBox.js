import React from 'react';

class CommentBox extends React.Component{
	constructor(props){
		super(props);

		this.state={
			value1:''
		}
		this.submitF=this.submitF.bind(this);
		this.handelChange=this.handelChange.bind(this);
	}
	submitF(){
		if (this.state.value1=="") {console.log("不可为空");return;}
		this.props.method(this.state.value1);
		this.setState({value1:''})
	}
	handelChange(e){
        this.setState({value1:e.target.value})
    }
	render(){
		return(
			<div>
				<p>留言内容</p>
				<textarea rows="3" style={{width: '100%'}} value={this.state.value1} onChange={this.handelChange}>
				</textarea>
				<button onClick={this.submitF}>提交</button>
			</div>
		)
	}
}

export default CommentBox;