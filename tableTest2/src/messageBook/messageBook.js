import React from 'react';
import CommentBox from './commentBox';
import CommentList from './commentList';

class MessageBook extends React.Component{
	constructor(props){
		super(props);

		this.state={
			comments:["1","2","3"]
		}
		this.listAdd=this.listAdd.bind(this);
		this.getList=this.getList.bind(this);
		this.delList=this.delList.bind(this);
	}
	listAdd(l){
		this.setState({
			comments:[...this.state.comments,l]
		})
		/*var c=this.state.comments;
		c.push(l);
	
	    this.setState({ //两种绑定方法
			comments:c
		})*/
	}
	getList(){
		return this.state.comments;
	}
	delList(i){
		let L=this.state.comments;
		L.splice(i,1);
		this.setState({
			comments:L
		})
	}
	render(){
		//const {comments} = this.state;
		return(
			<div>
				<CommentList clist={this.state.comments} del={this.delList}/>
				<CommentBox method={this.listAdd}/>
			</div>
		)
	}
}

export default MessageBook;