import React from 'react';

/*constructor(props){
	super(props);

	this.exportIndex=this.exportIndex.bind(this);
}
exportIndex(i){
	console.log("index:"+i)
}

const CommentList =({clist})=>{//两种方法
	return(
		<div>
			<p>评论列表</p>
			<ul>
				{clist.map((item,index)=>{
					return <li onDoubleClick={this.exportIndex(index)} key={index}>{item}</li>
				})}
			</ul>
		</div>
	)
}*/
class CommentList extends React.Component{//错误的方法
	constructor(props){
		super(props);
	}
	exportIndex(i){
		this.props.del(i);
	}
	render(){
		return(
			<div>
				<p>评论列表</p>
				{this.props.clist.map((item,index)=>{
					return <div onClick={this.exportIndex.bind(this,index)} key={index}>{item}</div>
				})}
			</div>
		)
	}
}

export default CommentList;