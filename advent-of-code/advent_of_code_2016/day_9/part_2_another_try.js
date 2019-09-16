function decompress(input) {
  let tokens = input.match(/[A-Z]|\(\d+x\d+\)/g);
  var message = '';
  var messageLength = 0

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

function fileRead(filename) {
  let contents = fs.readFileSync(filename);
  return contents.toString();
}

// let fs = require('fs');
// let input = fileRead('input.txt').replace(/\s+/g, '');
// console.log(decompress(input).length);

// test input:

console.log(decompress('(3x3)XYZ').length) // => XYZXYZXYZ => 9
console.log(decompress('X(8x2)(3x3)ABCY').length) // => XABCABCABCABCABCABCY => 20
console.log(decompress('(27x12)(20x12)(13x14)(7x10)(1x12)A').length) // => A... => 241920
console.log(decompress('(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN').length) // => 445
