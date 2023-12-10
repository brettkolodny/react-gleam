//import './index.css'

//import App from './main'

import Counter from "./main";

import { hydrateIslands } from "./clientHydrate";

console.log('hydrating...')
hydrateIslands({ Counter })
console.log('hydrated!')