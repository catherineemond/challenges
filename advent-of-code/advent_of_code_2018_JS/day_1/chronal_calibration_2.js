/*
goal:
  - find the first frequency that the list reaches twices

input:
  - same input as part 1
  - converted (as in part 1) to array of positive and negative integers

be careful:
  - it's not the same frequency change (i.e. the numbers in the array), but the frequency ~reached~
  - we might need to loop a few times over the list to find it
*/

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

// using array and includes:

function repeatedFrequency(input) {
  let frequencyChanges = parse(input);
  let reachedFrequencies = [];
  let currentFrequency = 0;
  let index = 0;

  while (true) {
    currentFrequency += frequencyChanges[index];

    if (reachedFrequencies.includes(currentFrequency)) {
      return currentFrequency;
    } else {
      reachedFrequencies.push(currentFrequency);
      index += 1;
      if (index === frequencyChanges.length) index = 0;
    }
  }
}

let fs = require('fs');
let input = fileRead('input.txt');
console.log(repeatedFrequency(input));
