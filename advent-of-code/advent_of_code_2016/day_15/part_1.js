// Part 1

var fs = require('fs');
var input = chomp(fileRead('input.txt')).split('\n');
var disks = input.map(makeDisk);

console.log(solution(disks)); // 148737

// Part 2

var newDisk = {
  number: 7,
  positions: 11,
  currentPosition: 0,
}

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

function makeDisk(string) {
  var data = string.match(/\d+/g);

  return {
    number: Number(data[0]),
    positions: Number(data[1]),
    currentPosition: Number(data[3]),
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
  return disks.every((disk) => {
    return getPosition(time, disk) == 0;
  });
}

function getPosition(startTime, disk) {
  return (startTime + disk.number + disk.currentPosition) % disk.positions;
}
