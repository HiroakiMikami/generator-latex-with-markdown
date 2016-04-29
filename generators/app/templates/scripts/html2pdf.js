const page = require('webpage').create();
const system = require('system');

const address = system.args[1];
const output = system.args[2];

page.open(address, function (status) {
  if (status !== 'success') {
    console.log('Unable to load the address!');
  } else {
    page.render(output);
  }
  phantom.exit();
});
