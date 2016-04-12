'use strict';
const yeoman = require('yeoman-generator');
const which = require('which');
const fs = require('fs');

const latexEngine = 'LaTeX engine';

module.exports = yeoman.Base.extend({
  prompting: function () {
    const done = this.async();

    const prompts = [
      {
        type: 'input',
        name: 'name',
        message: 'Your document name',
        default: this.appname.split(" ").join("-")
      },
      {
        type: 'list',
        name: latexEngine,
        message: 'LaTeX engine',
        choices: [
          'pdflatex',
          'pdftex',
          'lualatex',
          'platex'
        ],
        default: 'pdflatex',
        store: true
      }
    ];

    this.prompt(prompts, function (props) {
      this.props = props;
      done();
    }.bind(this));
  },

  default: {
    // Check whether depended tools are installed or not
    checkDependedTools: function () {
      const checkWhetherToolExists = (toolName, onSuccess, onError) => {
        this.log(`Checking ${toolName}`);
        which(toolName, (err, resolvedPath) => {
          if (err) {
            this.env.error(`${toolName} is not found.`);
          } else {
            this.log(`  ${toolName} exists`)
            onSuccess();
          }
        });
      };

      const done = this.async();
      new Promise((resolve, reject) => {
        // Check 'make'
        checkWhetherToolExists("make", () => { resolve(); });
      }).then(() => {
        // Check 'ln'
        return new Promise((resolve, reject) => {
          checkWhetherToolExists("ln", () => { resolve(); });
        });
      }).then(() => {
        // Check 'bash'
        return new Promise((resolve, reject) => {
          checkWhetherToolExists("bash", () => { resolve(); });
        });
      }).then(() => {
        // Check LaTeX engine
        return new Promise((resolve, reject) => {
          checkWhetherToolExists(this.props[latexEngine], () => { resolve(); });
        });
      }).then(() => {
        // Check 'inkscape'
        return new Promise((resolve, reject) => {
          checkWhetherToolExists('inkscape', () => { resolve(); });
        });
      }).then(() => {
        // Check 'dot' (TODO: should not abort when dot is not found)
        return new Promise((resolve, reject) => {
          checkWhetherToolExists('dot', () => { resolve(); });
        });
      }).then(() => {
        // Check 'pandoc'
        checkWhetherToolExists("pandoc", () => { done(); });
      });
    }
  },

  writing: function () {
    const done = this.async();

    // Copy all files from the template directory
    fs.readdir(this.sourceRoot(), (err, files) => {
      if (err) {
        this.env.error(err);
      } else {
        const templateParameter = {
          documentName: this.props['name'],
          latexEngine: this.props[latexEngine]
        };

        for (var i = 0; i < files.length; i++) {
          const file = files[i];

          if (file == "src") {
            // Should not use copyTpl because the source directory includes binary files (images)
            this.fs.copy(
              this.templatePath(file),
              this.destinationPath(file)
            )
          } else {
            this.fs.copyTpl(
              this.templatePath(file),
              this.destinationPath(file),
              templateParameter
            );
          }
        }
      }
      done();
    })

    // Copy Makefiles
    /*
    this.fs.copy(
      this.templatePath('Makefile'),
      this.destinationPath('Makefile')
    );
    this.fs.copy(
      this.templatePath('parameters.mk'),
      this.destinationPath('parameters.mk')

    /*
    this.fs.copy(
      this.templatePath('dummyfile.txt'),
      this.destinationPath('dummyfile.txt')
    );
    */
  },

  install: function () {
//    this.installDependencies();
  }
});
