import { rename } from 'fs';

const callback = () => {};
const main = () => {

    const dir = "/Users/alex/Documents/projects/react_gleam/ssr-example/"
    const build = "build/dev/javascript/example"
    const oldFileName = `${dir}${build}/entry-client.js`;
    const oldFileName2 = `${dir}${build}/entry-server.js`;
    const newFileName = `${dir}${build}/entry-client.jsx`;
    const newFileName2 = `${dir}${build}/entry-server.jsx`;

    
    rename(oldFileName, newFileName, callback);

    rename(oldFileName2, newFileName2, callback);

}

main();