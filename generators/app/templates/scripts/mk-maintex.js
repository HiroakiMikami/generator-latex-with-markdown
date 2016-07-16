#!/bin/env node
'use strict'

const fs = require('fs');

// Read command line arguments
const documentClassData = process.argv[2];
const mainTexName = process.argv[3];
const preambleTexName = process.argv[4];
const documentTexName = process.argv[5];
const target = process.argv[6];

// Parse the json file and obtain data
const json = JSON.parse(fs.readFileSync(documentClassData, 'utf8'));

const documentClass = json.documentclass || "article"
const options = json.options || []

// Generate the main tex file
const content = `
\\ifdraftmode
  \\documentclass[${options.join(',')}, draft]{${documentClass}}
\\else
  \\documentclass[${options.join(',')}]{${documentClass}}
\\fi
\\usepackage{lineno}
\\input{${preambleTexName}}
\\begin{document}
\\iflineno
  \\linenumbers
\\fi
\\input{${documentTexName}}
\\end{document}
`

// Write the main tex file
fs.writeFileSync(target, content, 'utf8')
