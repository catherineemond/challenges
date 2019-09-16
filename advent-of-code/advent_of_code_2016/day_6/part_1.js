'use strict';

// Extracting data from the input:

function fileRead(filename) {
  let contents = fs.readFileSync(filename);
  return contents.toString();
}

let fs = require('fs');
let input = fileRead('input.txt').split('\n');

// Transposing the data:

let transposedArray = [];
let length = input[0].length

for (let i = 0; i < length; i += 1) {
  transposedArray[i] = [];
  input.forEach((str) => transposedArray[i].push(str[i]));
}

// for some reason I get an (unwanted) undefined value at the end of each column

let mostFrequent = '';
let leastFrequent = '';

transposedArray.forEach(function(column) {
  let count = {};

  column.pop(); // this is only to take care of the unwanted undefined value
  column.forEach((char) => count[char] ? count[char] += 1 : count[char] = 1);

  let maxCount = Math.max(...Object.values(count));
  let mostFrequentChar = Object.keys(count).find((key) => count[key] === maxCount);
  mostFrequent += mostFrequentChar;

  let minCount = Math.min(...Object.values(count));
  let leastFrequentChar = Object.keys(count).find((key) => count[key] === minCount);
  leastFrequent += leastFrequentChar;
});

console.log(mostFrequent);
console.log(leastFrequent);
