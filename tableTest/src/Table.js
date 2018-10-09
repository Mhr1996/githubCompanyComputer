import React from 'react';
import 'bootstrap/dist/css/bootstrap.css';
require('bootstrap')
class Table extends React.Component{
	render(){
		return(
			<div>
				<a href="http://www.baidu.com">{this.props.name}</a>
				<div className="btn-group" role="group" aria-label="...">
  <button type="button" className="btn btn-default">1</button>
  <button type="button" className="btn btn-default">2</button>

  <div className="btn-group" role="group">
    <button type="button" className="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Dropdown
      <span className="caret"></span>
    </button>
    <ul className="dropdown-menu">
      <li><a href="#">Dropdown link</a></li>
      <li><a href="#">Dropdown link</a></li>
    </ul>
  </div>
</div>
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