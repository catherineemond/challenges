// Simple non-optimized solution to part 1

const salt = 'ahsbgdzn';
console.log(findIndex()); // 23890

function findIndex() {
  var index = 0;
  var keyCount = 0;

  while (true) {
    var hash = md5(salt + index);
    var triple = hasTripleChar(hash);

    if (triple) {
      var sequence = triple[0][0].repeat(5);
      if (findMatch(sequence, index + 1)) keyCount += 1;
    }

    if (keyCount == 64) return index;
    index += 1;
  }
}

function md5(str) {
  var crypto = require('crypto');
  var hash = crypto.createHash('md5');
  var data = hash.update(str);

  return data.digest('hex');
}

function hasTripleChar(str) {
  return str.match(/(.)\1{2}/g);
}

function findMatch(sequence, index) {
  for (let i = index; i < index + 1000; i += 1) {
    let hash = md5(salt + i);
    let regex = new RegExp(sequence);
    if (regex.test(hash)) return true;
  }

  return false;
}
