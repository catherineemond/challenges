const gridSize = 4;
const passCode = 'hijkl' // test input
const directions = {
  u: [-1, 0],
  d: [1, 0],
  l: [0, -1],
  r: [0, 1],
}
const start = [0, 0];
const goal = [3, 3];

console.log(findPaths());

function findPaths() {
  var paths = []
  var frontier = [];
  var stepsTo = {};

  frontier.push(start);
  stepsTo[start] = '';

  while (frontier.length > 0) {
    let currentNode = frontier.shift();
    let pathTaken = stepsTo[currentNode];

    if (isGoal(currentNode)) {
      paths.push(pathTaken);
    } else {
      let openRooms = neighbors(currentNode, pathTaken);

      Object.keys(openRooms).forEach((direction) => {
        let nextNode = openRooms[direction];
        frontier.push(nextNode);
        stepsTo[nextNode] = pathTaken + direction.toUpperCase();
      });
    }
  }

  return paths;
}

// ----------------------------------------------------------------

function neighbors(node, pathTaken) {
  var openRooms = {};

  openDirections(pathTaken).forEach((d) => {
    let x = node[0] + directions[d][0];
    let y = node[1] + directions[d][1];

    if (inRange(x) && inRange(y)) openRooms[d] = [x, y];
  });

  return openRooms;
}

function openDirections(pathTaken) {
  var hash = md5(passCode + pathTaken).slice(0, 4);
  console.log(passCode + pathTaken)
  console.log(hash);
  var openDoors = [];

  for (let i = 0; i < 4; i += 1) {
    if (/[b-f]/.test(hash[i])) openDoors.push(Object.keys(directions)[i]);
  }

  return openDoors;
}

function inRange(n) {
  return n >= 0 && n < gridSize;
}

function md5(str) {
  var crypto = require('crypto');
  var hash = crypto.createHash('md5');
  var data = hash.update(str);

  return data.digest('hex');
}

function isGoal(node) {
  return node[0] == goal[0] && node[1] == goal[1];
}
