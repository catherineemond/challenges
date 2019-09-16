// This one works!

function decompress(input) {
  let tokens = input.match(/[A-Z]|\(\d+x\d+\)/g);
  let totalLength = 0;

  while (tokens.length > 0) {
    let currentToken = tokens.shift();

    if (currentToken.length === 1) {
      totalLength += 1;
    } else {
      let [length, times] = currentToken.match(/\d+/g);
      totalLength += takeSlice(tokens, length) * times;
    }
  }

  return totalLength;
}

function takeSlice(tokens, length) {
  let slice = '';

  while (slice.length < length) {
    slice += tokens.shift();
  }

  let markers = slice.match(/\(\d+x\d+\)/g);

  if (!markers) {
    return slice.length;
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
console.log(decompress(input)); // 10943094568

// test input:

// console.log(decompress('(3x3)XYZ')) // => XYZXYZXYZ => 9
// console.log(decompress('X(8x2)(3x3)ABCY')) // => XABCABCABCABCABCABCY => 20
// console.log(decompress('(27x12)(20x12)(13x14)(7x10)(1x12)A')) // => A... => 241920
// console.log(decompress('(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN')) // => 445
