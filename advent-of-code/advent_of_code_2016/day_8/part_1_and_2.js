function swipeCard() {
  let screen = blankScreen();
  let commands = parseInput();

  commands.forEach((command) => {
    if (/rect/.test(command)) {
      screen = rectangle(screen, command);
    } else if (/row/.test(command)) {
      screen = rotateRow(screen, command);
    } else if (/column/.test(command)) {
      screen = rotateColumn(screen, command);
    }
  });

  console.log(pixelCount(screen));
  display(screen);
}

function blankScreen() {
  let screen = [];

  for (let i = 0; i < 6; i += 1) {
    screen[i] = new Array(50).fill(' ');
  }

  return screen;
}

function parseInput() {
  function fileRead(filename) {
    let contents = fs.readFileSync(filename);
    return contents.toString();
  }

  let fs = require('fs');
  return fileRead('input.txt').split('\n');
}

function parseCommand(command) {
  return command.match(/\d+/g).map(Number);
}

function rectangle(screen, command) {
  let width, height;
  [width, height] = parseCommand(command);

  for (let i = 0; i < height; i += 1) {
    for (let j = 0; j < width; j += 1) {
      screen[i][j] = '#';
    }
  }

  return screen;
}

function rotateRow(screen, command) {
  let row, shift;
  [row, shift] = parseCommand(command);

  screen[row] = rotate(screen[row], shift);

  return screen;
}

function rotateColumn(screen, command) {
  let col, shift;
  [col, shift] = parseCommand(command);

  screen = transpose(screen);
  screen[col] = rotate(screen[col], shift);

  return transpose(screen);
}

function rotate(array, shift) {
  let copy = [...array];

  return copy.map((el, idx) => {
    let newIndex = idx - shift;
    if (newIndex < 0) newIndex += array.length;
    return array[newIndex];
  });
}

function transpose(matrix) {
  let transposed = [];
  let length = matrix[0].length

  for (let i = 0; i < length; i += 1) {
    transposed[i] = [];
    matrix.forEach((row) => transposed[i].push(row[i]));
  }

  return transposed;
}

function pixelCount(screen) {
  return screen.map((row) => {
    let count = 0;

    row.forEach((px) => {
      if (px === '#') count += 1;
    });

    return count;
  }).reduce((a, b) => a + b);
}

function display(screen) {
  screen.forEach((row) => console.log(row.join('')));
}

swipeCard();
