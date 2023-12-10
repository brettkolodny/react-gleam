// source code copied from https://github.com/gulpjs/replace-ext
// wasn't working with es6, so I downloaded it and mofied it slightly
import { basename, extname, join, dirname, sep } from 'path';

export const replaceExt = (npath, ext) => {
    if (typeof npath !== 'string') {
      return npath;
    }
  
    if (npath.length === 0) {
      return npath;
    }
  
    var nFileName = basename(npath, extname(npath)) + ext;
    var nFilepath = join(dirname(npath), nFileName);
  
    // Because `path.join` removes the head './' from the given path.
    // This removal can cause a problem when passing the result to `require` or
    // `import`.
    if (startsWithSingleDot(npath)) {
      return '.' + sep + nFilepath;
    }
  
    return nFilepath;
  }
  
  function startsWithSingleDot(fpath) {
    var first2chars = fpath.slice(0, 2);
    return first2chars === '.' + sep || first2chars === './';
  }