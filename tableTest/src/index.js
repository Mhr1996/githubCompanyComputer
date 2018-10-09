import React from 'react';
import ReactDOM from 'react-dom';
import Table from './table';
require('./index.css');
class Template extends React.Component{
	render(){
		return(
			<div>
				<ul>
					33
				</ul>
			</div>
		)
	}
}

//export default Template;

ReactDOM.render(<div><Template /><Table /></div>, document.getElementById('demo'));