import React from 'react'
import ReactDOMServer from 'react-dom/server'
//import App from './App'
import Counter from "./main.js";


export function render() {
  const html = ReactDOMServer.renderToString(
      <Counter />
  )
  return { html }
}