const input = 1358;
const start = [1, 1];
const goal = [31, 39];
const maxSteps = 50;

// Main algorithm:

function solution() {
  var frontier = []; // works as a queue, fifo
  var stepsTo = {};

  frontier.push(start);
  stepsTo[start] = 0;

  while (frontier.length > 0) {
    let current = frontier.shift();

    if (isGoal(current)) {
      console.log(`Shortest path to goal (number of steps): ${stepsTo[current]}`);
      console.log(`Locations visited in 50 steps or less: ${visitedInMaxSteps(stepsTo)}`);
      return;
    }

    let openNeighbors = findNeighbors(current).filter(isOpen);

    openNeighbors.forEach((neighbor) => {
      if (!stepsTo[neighbor]) {
        frontier.push(neighbor);
        stepsTo[neighbor] = stepsTo[current] + 1;
      }
    });
  }
}

solution();

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

function visitedInMaxSteps(stepsTo) {
  return Object.keys(stepsTo).filter((location) => stepsTo[location] <= maxSteps).length;
}
