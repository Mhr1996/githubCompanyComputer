import React from 'react';

export const Themes = {
  black: {
    foreground: '#000000',
    background: '#000000',
  },
  white: {
    foreground: '#ffffff',
    background: 'red',
  },
};

export const ThemeContext = React.createContext(
  Themes.white // default value
);