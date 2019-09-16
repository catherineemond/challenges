const md5 = require('md5');

var input = 'abc';
var index = 0;
var password = [];
var validHashPattern = /^00000.+/;
var hash;

while (password.length < 8 || password.includes(undefined)) {
  index += 1;
  hash = md5(input + index);

  if (validHashPattern.test(hash)) {
    if (/[^0-7]/.test(hash[5])) continue;
    let position = Number(hash[5]);
    if (password[position]) continue;
    password[position] = hash[6];
  }
}

console.log(password.join(''));
