/*
version 2: markers within data ARE decompressed

how does this work?
  - if a marker is included inside data
    - it doesn't count as chars
    - only the repeat number is relevant
    - we compound multiplication of the chars with that number

examples: see test cases

For now it passes the simple test cases, but not the real input.
It seems to me it's something with how JS parses long inputs (??)
Maybe translate the code to Ruby and see if the logic is sound.

afterthoughts:
  - I get an error because the string I'm building is way too long!
  - I need to refactor this to work with lengths instead of building the string
*/

function decompress(input) {
  let tokens = input.match(/[A-Z]|\(\d+x\d+\)/g);
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

  return message;
}

function takeSlice(tokens, length) {
  let slice = '';

  while (slice.length < length) {
    slice += tokens.shift();
  }

  let markers = slice.match(/\(\d+x\d+\)/g);

  if (!markers) {
    return slice;
  } else {
    return decompress(slice);
  }
}

function fileRead(filename) {
  let contents = fs.readFileSync(filename);
  return contents.toString();
}

let fs = require('fs');
let input = fileRead('input.txt').replace(/\s+/g, '');
console.log(decompress(input).length);

// test input:

// console.log(decompress('(3x3)XYZ').length) // => XYZXYZXYZ => 9
// console.log(decompress('X(8x2)(3x3)ABCY').length) // => XABCABCABCABCABCABCY => 20
// console.log(decompress('(27x12)(20x12)(13x14)(7x10)(1x12)A').length) // => A... => 241920
// console.log(decompress('(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN').length) // => 445
