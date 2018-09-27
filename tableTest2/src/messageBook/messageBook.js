import React from 'react';
import CommentBox from './commentBox';
//import CommentList from './commentList';

class MessageBook extends React.Component{
	constructor(props){
		super(props);

		this.state={
			comments:[]
		}
		this.listAdd=this.listAdd.bind(this);
	}
	listAdd(l){
		var c=this.state.comments;
		c.push(l);
		this.setState={
			comments:c
		}
		console.log("添加后的list");
		console.log(this.state.comments);
	}
	render(){
		return(
			<CommentBox method={this.listAdd}/>
		)
	}
}

export default MessageBook;