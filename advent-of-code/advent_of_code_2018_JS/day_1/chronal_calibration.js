function fileRead(filename) {
  let contents = fs.readFileSync(filename);
  return contents.toString();
}

function resultingFrequency(input) {
  let frequencies = parse(input);
  return frequencies.reduce((a, b) => a + b);
}

function parse(input) {
  return input.split('\n').map(Number);
}

let fs = require('fs');
let input = fileRead('input.txt');
console.log(resultingFrequency(input));
