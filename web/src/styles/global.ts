import { createGlobalStyle } from "styled-components";
import { mixins } from "./mixins";

export const GlobalStyle = createGlobalStyle`
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  body {
    background: "white";
    color: "black";
    -webkit-font-smoothing: antialiased;
  }

  body, input, textarea, button {
    ${mixins.fonts.buttonG};
  }

  button {
    border: none;
    cursor: pointer;
  }
`