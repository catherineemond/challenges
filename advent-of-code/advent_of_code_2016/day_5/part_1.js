const md5 = require('md5');

var input = 'abc';
var index = 0;
var password = '';
var validHashPattern = /^00000.+/;
var hash;

while (password.length < 8) {
  hash = md5(input + index);
  if (validHashPattern.test(hash)) password += hash[5];
  index += 1;
}

console.log(password);
