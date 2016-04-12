'use strict'

// assemble all tex files into 1 file
// TODO: deal with text encoding that is not utf8
// TODO: This script sometimes does not work because it does not parse the LaTeX file.

const fs = require('fs');

const rootDir = process.argv[2];
const rootFile = process.argv[3];

function assemble(text) {
  const input = /\s*\\input\{([^}]*)\}/;
  const include = /\s*\\include\{([^}]*)\}/;

  var lines = text.split("\n");
  var newLines = [];

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    const inputResult = line.match(input);
    const includeResult = line.match(include);
    if (inputResult != null) {
      let name = inputResult[1];
      if (!name.endsWith("tex")) {
        name = `${name}.tex`
      }
      const contents = fs.readFileSync(`${rootDir}/${name}`, 'utf8');
      newLines.push(contents);
    } else if (includeResult != null) {
      let name = includeResult[1];
      if (!name.endsWith("tex")) {
        name = `${name}.tex`
      }
      const contents = fs.readFileSync(`${rootDir}/${name}`, 'utf8');
      newLines.push(`${contents}\n\\break`);
    } else {
      newLines.push(line);
    }
  }

  const newText = newLines.join("\n");
  if (text == newText) {
    return newText;
  } else {
    return assemble(newText);
  }
}

console.log(assemble(fs.readFileSync(rootFile, 'utf8')));
