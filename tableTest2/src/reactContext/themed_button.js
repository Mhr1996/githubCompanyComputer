import React from 'react';
import {ThemeContext} from './theme_context';

function ThemedButton(props) {
  return (
    <ThemeContext.Consumer>
      {theme => (
        <button
          {...props}
          style={{backgroundColor: theme.background}}
        > 我是按钮</button>

      )}
    </ThemeContext.Consumer>
  );
}

export default ThemedButton;