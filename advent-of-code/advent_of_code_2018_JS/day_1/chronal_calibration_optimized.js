function fileRead(filename) {
  let contents = fs.readFileSync(filename);
  return contents.toString();
}

function chomp(text) {
  return text.replace(/(\n)+$/, '');
}

function parse(input) {
  return chomp(input).split('\n').map(Number);
}

function repeatedFrequency(input) {
  let frequencyChanges = parse(input);
  let reachedFrequencies = {};
  let currentFrequency = 0;
  let index = 0;

  while (true) {
    currentFrequency += frequencyChanges[index];
    if (reachedFrequencies[currentFrequency]) {
      return currentFrequency;
    } else {
      reachedFrequencies[currentFrequency] = 1;
      index += 1;
      if (index === frequencyChanges.length) index = 0;
    }
  }
}



let fs = require('fs');
let input = fileRead('input.txt');
console.log(repeatedFrequency(input));
