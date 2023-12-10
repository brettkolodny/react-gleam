import React from 'react'
import ReactDOMServer from 'react-dom/server'
//import App from './main'
import Island from './Island'
import Counter from "./main";

export function render() {
  const html = ReactDOMServer.renderToString(
  <Island componentName="Counter" islandTag='span'>
      <Counter count={4}/>
  </Island>
  )
  return { html }
}