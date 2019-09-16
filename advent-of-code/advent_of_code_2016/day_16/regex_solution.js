// I like this way to use replace, but using regex is too slow for part 2

const input = '11100010111110100';
const length = 35651584;

console.log(checksum(expand(input)));

//-----------------------------------------------------

function expand(a) {
  while (a.length < length) {
    var b = a.split('').reverse().join('').replace(/(0|1)/g, flip);
    a = a + '0' + b;
  }

  return a;
}

function flip(value) {
  return value == '1' ? '0' : '1';
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

// recursive checksum:

function checksum(data) {
  data = data.slice(0, length);

  if (data.length % 2 == 1) {
    return data;
  } else {
    var pairs = data.match(/\d{2}/g);
    var newData = pairs.map((pair) => pair[0] == pair[1] ? '1' : '0').join('');
    return checksum(newData);
  }
}
