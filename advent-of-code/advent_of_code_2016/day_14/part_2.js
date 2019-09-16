// Using a a cache to avoid recomputing the hash

const salt = 'ahsbgdzn';
console.log(findIndex()); // 22696

function findIndex() {
  var hashes = {};
  var index = 0;
  var keyCount = 0;

  while (true) {
    var key = salt + index;
    var hash = getHash(hashes, key);
    var triple = hasTriple(hash);

    if (triple) {
      var sequence = triple[0][0].repeat(5);

      if (findMatch(hashes, sequence, index)) {
        keyCount += 1;
        if (keyCount == 64) return index;
      }
    }

    index += 1;
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

function getHash(hashes, key) {
  var hash = hashes[key];

  if (!hash) {
    hash = stretchedMD5(key);
    hashes[key] = hash;
  }

  return hash;
}

function hasTriple(str) {
  return str.match(/(.)\1{2}/g);
}

function findMatch(hashes, sequence, index) {
  for (let i = index + 1; i < index + 1000; i += 1) {
    let key = salt + i;
    let hash = getHash(hashes, key);
    let regex = new RegExp(sequence);
    if (regex.test(hash)) return true;
  }

  return false;
}
