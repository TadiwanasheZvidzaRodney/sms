import { createTheme } from '@mui/material/styles';

const theme = createTheme({
  palette: {
    primary: {
      main: '#000000', // Black for main buttons and highlights
      light: '#333333',
      dark: '#000000',
      contrastText: '#ffffff',
    },
    secondary: {
      main: '#666666', // Gray for accents and secondary actions
      light: '#888888',
      dark: '#444444',
      contrastText: '#ffffff',
    },
    background: {
      default: '#fafafa', // Light gray background for the app
      paper: '#ffffff', // White for paper/card components
    },
    text: {
      primary: '#000000', // Black text for readability
      secondary: '#666666', // Gray secondary text
    },
    action: {
      hover: '#f5f5f5', // Hover state color
      selected: '#eeeeee',
    },
    divider: '#e0e0e0',
  },
  typography: {
    fontFamily: ['Inter', 'Roboto', 'Arial', 'sans-serif'].join(','),
    h1: {
      fontSize: '3rem',
      fontWeight: 600,
      letterSpacing: '0.2rem',
      color: '#212121',
    },
    h2: {
      fontSize: '2.5rem',
      fontWeight: 500,
      color: '#212121',
    },
    h3: {
      fontSize: '2rem',
      fontWeight: 400,
    },
    h4: {
      fontSize: '1.5rem',
      fontWeight: 400,
    },
    body1: {
      fontSize: '1rem',
      fontWeight: 400,
    },
    button: {
      textTransform: 'none', // Avoids uppercase transformation for buttons
    },
  },
  breakpoints: {
    values: {
      xs: 0,
      sm: 600,
      md: 960,
      lg: 1280,
      xl: 1920,
    },
  },
  shape: {
    borderRadius: 8, // Rounded corners for all elements
  },
});

export default theme;
