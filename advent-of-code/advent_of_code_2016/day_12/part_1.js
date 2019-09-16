/*
- 4 registers (a, b, c, d)
  - they all start at 0 and can contain any integer
- a set of instructions
  - cpy x y => copy x (either a given integer or a register value) into y
  - inc x => increases value of register x by 1
  - dec x => decreases value of register x by 1
  - jnz x y => jumps to an instruction y away IF x is NOT zero

ideas:
  - registers can be simple variables containing integers
  - define a variable index to track the index in the instructions array
  - use a while loop to iterate over the instructions as long as index < instructions.length
*/

function fileRead(filename) {
  let contents = fs.readFileSync(filename);
  return contents.toString();
}

function chomp(text) {
  return text.replace(/(\n)+$/, '');
}

function parse(instruction) {
  let tokens = instruction.split(' ');

  return {
    command: tokens[0],
    x: getValue(tokens[1]),
    y: getValue(tokens[2]),
  };
}

function getValue(str) {
  return /\d+/.test(str) ? Number(str) : str;
}

function execute(instruction) {
  let command = instruction.command;
  let x = instruction.x;
  let y = instruction.y;

  if (command === 'cpy') {
    copy(x, y);
  } else if (command === 'inc') {
    increment(x);
  } else if (command === 'dec') {
    decrement(x);
  } else if (command === 'jnz') {
    jump(x, y);
  }
}

function copy(value, register) {
  if (typeof value !== 'number') value = registers[value];

  registers[register] = value;
  index += 1;
}

function increment(register) {
  registers[register] += 1;
  index += 1;
}

function decrement(register) {
  registers[register] -= 1;
  index += 1;
}

function jump(value, distance) {
  if (value === 0 || registers[value] === 0) {
    index += 1;
  } else {
    index += distance;
  }
}

var fs = require('fs');
var input = fileRead('input.txt')
var instructions = chomp(input).split('\n').map((instruction) => parse(instruction));
var index = 0;
var registers = {
  a: 0,
  b: 0,
  c: 1,
  d: 0,
}

while (index < instructions.length) {
  execute(instructions[index]);
}

console.log(registers);
