const input = 1358;
const start = [1, 1];
const goal = [31, 39];

// Main algorithm:

function findShortestPath() {
  var frontier = []; // works as a queue, fifo
  var stepsToPosition = {};

  frontier.push(start);
  stepsToPosition[start] = 0;

  while (frontier.length > 0) {
    let current = frontier.shift();
    if (isGoal(current)) return stepsToPosition[current];

    let openNeighbors = findNeighbors(current).filter(isOpen);

    openNeighbors.forEach((neighbor) => {
      if (!stepsToPosition[neighbor]) {
        frontier.push(neighbor);
        stepsToPosition[neighbor] = stepsToPosition[current] + 1;
      }
    });
  }
}

console.log(findShortestPath()); // 96

//------------------------------------------------------------------
// Helpers:

function findNeighbors(coordinate) {
  var x;
  var y;
  [x, y] = coordinate;

  var possibleNeighbors = [
    [x - 1, y],
    [x + 1, y],
    [x, y - 1],
    [x, y + 1],
  ];

  return possibleNeighbors.filter(validCoordinate);
}

function validCoordinate(coordinate) {
  return coordinate.every((n) => n >= 0);
}

function isOpen(coordinate) {
  var x;
  var y;
  [x, y] = coordinate;

  var number = x*x + 3*x + 2*x*y + y + y*y;
  number += input;

  var binaryString = number.toString(2);
  var ones = binaryString.split('').filter((digit) => digit == '1');

  return ones.length % 2 == 0;
}

function isGoal(coordinate) {
  return coordinate[0] == goal[0] && coordinate[1] == goal[1];
}
