// recursive solution
// lesson learned: don't use regex here, it's too slow

const input = '11100010111110100';
const length = 35651584;

console.log(checksum(expand(input))); // 01010001101011001

//-----------------------------------------------------

function expand(a) {
  if (a.length >= length) {
    return a;
  } else {
    let b = flip(a.split('').reverse().join(''));
    return expand(a + '0' + b);
  }
}

function flip(string) {
  return string.split('').map((char) => char == '1' ? '0' : '1').join('');
}

function checksum(data) {
  if (data.length > length) data = data.slice(0, length);
  if (data.length % 2 == 1) return data;

  var newData = '';

  for (let i = 0; i < data.length; i += 2) {
    newData += data[i] == data[i + 1] ? '1' : '0';
  }

  return checksum(newData);
}
