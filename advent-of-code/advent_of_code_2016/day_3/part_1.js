function fileRead(filename) {
  var contents = fs.readFileSync(filename);
  return contents.toString();
}

var fs = require('fs');
var input = fileRead('input.txt').split('\n');

var possible_triangles = input.map((str) => str.match(/\w+/g));

possible_triangles.pop(); // for some reason, there is an unwanted null value at the end

let count = 0

possible_triangles.forEach(function(arr) {
  sides = arr.map((str) => Number(str)).sort((a, b) => a - b);
  if (sides[0] + sides[1] > sides[2]) count += 1;
});

console.log(count);
