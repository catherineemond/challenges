/*
task: complex string parsing, once again!

input: a string, containing
  - uppercase letters
  - parentheses groups with numbers and x => (106x9), (9x11), ...
  - spaces?

output: a number, the decompressed length of the file (without whitespace)

rules:
  - whitespace is ignored
  - the parentheses groups are 'markers'
    - ex (10x2) => take next 10 chars and repeat 2 times
    - the marker itself is not included in the decompressed output
    - continue reading the file after the repeated data
  - if parentheses appear within the data referenced by a marker => treat as normal data

examples: see test cases

ideas:
  - it somehow has to be done as i go, keeping track of the index and buiding a new string
    - if char = letter => simply push letter to new string
    - if char = ( => I have to grab the entire marker
      - the marker tells me what slice to get (how many chars) and how many times to repeat
      - then continue iteration AFTER that slice.
    - thinking of using shift or sim. to actually modify the array of chars
    - better to work with a string or an array?
*/

function decompress(input) {
  let tokens = input.match(/\w|\(\d+x\d+\)/g);
  let message = '';

  while (tokens.length > 0) {
    let currentToken = tokens.shift();

    if (currentToken.length === 1) {
      message += currentToken;
    } else {
      let [length, times] = currentToken.match(/\d+/g);
      let chars = takeSlice(tokens, length);
      message += chars.repeat(times);
    }
  }

  return message.length;
}

function takeSlice(tokens, length) {
  let slice = '';

  while (slice.length < length) {
    slice += tokens.shift();
  }

  return slice;
}

function fileRead(filename) {
  let contents = fs.readFileSync(filename);
  return contents.toString();
}

let fs = require('fs');
let input = fileRead('input.txt').replace(/\s+/g, '');
console.log(decompress(input)); // 99145

// console.log(decompress('ADVENT')) // => ADVENT => 6
// console.log(decompress('A(1x5)BC')) // => ABBBBBC => 7
// console.log(decompress('(3x3)XYZ')) // => XYZXYZXYZ => 9
// console.log(decompress('A(2x2)BCD(2x2)EFG')) // => ABCBCDEFEFG => 11
// console.log(decompress('(6x1)(1x3)A')) // => (1x3)A => 6
// console.log(decompress('X(8x2)(3x3)ABCY')) // => X(3x3)ABC(3x3)ABCY => 18
