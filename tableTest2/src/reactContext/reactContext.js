import React from 'react';
import {ThemeContext, Themes} from './theme_context';
import ThemedButton from './themed_button';

class ReactContext extends React.Component{
	constructor(props){
		super(props)
		this.state={
			theme:Themes.black
		}

		this.changeColor = this.changeColor.bind(this);
	}
	changeColor(){
		this.setState(state => ({
			theme:state.theme === Themes.black ? Themes.white : Themes.black
		}))
	}
	render(){
		return(
			<div>
				<ThemeContext.Provider value={this.state.theme}> 
					 <ThemedButton onClick={this.changeColor}>
				      Change Theme
				    </ThemedButton>
				</ThemeContext.Provider>
				<div>
		          	<ThemedButton />
		        </div>
			</div>
		)
	}
}

export default ReactContext;