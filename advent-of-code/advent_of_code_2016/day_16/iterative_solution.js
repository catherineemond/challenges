// iterative solution
// lesson learned: don't use regex here, it's too slow

const input = '11100010111110100';
const length = 35651584;

console.log(checksum(expand(input)));

//-----------------------------------------------------

function expand(a) {
  while (a.length < length) {
    var b = flip(a.split('').reverse().join(''));
    a = a + '0' + b;
  }

  return a;
}

function flip(string) {
  return string.split('').map((char) => char == '1' ? '0' : '1').join('');
}

function checksum(data) {
  if (data.length > length) data = data.slice(0, length);

  while (data.length % 2 == 0) {
    let checksum = '';

    for (let i = 0; i < data.length; i += 2) {
      checksum += data[i] == data[i + 1] ? '1' : '0';
    }

    data = checksum;
  }

  return data;
}
