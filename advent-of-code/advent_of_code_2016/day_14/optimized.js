// I thought this would optimize the code by looking only at triples, but it's still really slow
// Not sure if it's faster than the first one

const salt = 'abc';
var triples = {};
var keys = [];

findTriples();

while (true) {
  let indices = Object.keys(triples).map(Number);
  let currentIndex = indices[0];
  let lastIndex = indices[indices.length - 1];
  let sequence = new RegExp(triples[currentIndex].char.repeat(5));
  delete triples[currentIndex];

  findTriples(currentIndex, lastIndex);

  if (Object.keys(triples).find((index) => sequence.test(triples[index].hash))) {
    keys.push(currentIndex);
  }

  if (keys.length == 64) {
    console.log(keys[keys.length - 1]);
    return;
  }
}

function findTriples(currentIndex = 0, lastIndex = 0) {
  for (let i = lastIndex + 1; i <= currentIndex + 1000; i += 1) {
    let key = salt + i;
    let hash = stretchedMD5(key);
    let triple = hash.match(/(.)\1{2}/g);
    if (triple) {
      triples[i] = { hash: hash, char: triple[0][0] };
    }
  }
}

function md5(str) {
  var crypto = require('crypto');
  var hash = crypto.createHash('md5');
  var data = hash.update(str);

  return data.digest('hex');
}

function stretchedMD5(str) {
  for (let i = 0; i < 2017; i += 1) {
    str = md5(str);
  }

  return str;
}
