// Part 1

var fs = require('fs');
var input = chomp(fileRead('input.txt')).split('\n');
var disks = input.map(parseData);

console.log(solution(disks)); // 148737

// Part 2

var newDisk = makeDisk(7, 11, 0);
disks.push(newDisk);
console.log(solution(disks)); // 2353212

//--------------------------------------------------------------------

function fileRead(filename) {
  var contents = fs.readFileSync(filename);
  return contents.toString();
}

function chomp(text) {
  return text.replace(/(\n)+$/, '');
}

function parseData(string) {
  var data = string.match(/\d+/g);
  var number = Number(data[0]);
  var positions = Number(data[1]);
  var currentPosition = Number(data[3]);

  return makeDisk(number, positions, currentPosition);
}

function makeDisk(number, positions, currentPosition) {
  return {
    number: number,
    positions: positions,
    currentPosition: currentPosition,
    positionAt: function(time) {
      return (time + this.number + this.currentPosition) % this.positions;
    }
  };
}

function solution(disks) {
  var time = 0;

  while (true) {
    if (areAligned(time, disks)) return time;
    time += 1
  }
}

function areAligned(time, disks) {
  return disks.every((disk) => disk.positionAt(time) == 0);
}
