/*
input:
  - list of instructions, separated by a new line
  - two formats:
    - 'value x goes to bot y': describe the initial state
    - 'bot x gives low to bot y and high to bot z': moving around of data

output:
  - an integer
  - the number of the bot responsible for comparing values 61 and 17

notes:
  - the bot can also place the 'value' in an output bin
  - the sequence if the 'shuffling' matters

ideas:
  - initialize all needed variables
  - first process all the initial instructions ('value x to bot y')

questions:
  - is there some kind of ordering of the input instructions?
    - yes, a bot 'gives' his chips only when he has two of them
*/

const lookedForValues = [61, 17]
var bots = {}
var outputs = {}
var lookedForBot;

function findBot(input) {
  let instructions = chomp(input).split('\n');
  let initialInstructions = instructions.filter((instruction) => /^value/.test(instruction));
  let shufflingInstructions = instructions.filter((instruction) => /^bot/.test(instruction));

  setStartingState(initialInstructions)
  shuffleChips(shufflingInstructions)

  console.log(lookedForBot); // part 1
  console.log(outputs[0] * outputs[1] * outputs[2]); // part 2
}

function setStartingState(initialInstructions) {
  initialInstructions.forEach((string) => {
    let parsedNumbers = string.match(/\d+/g).map(Number);
    let value = parsedNumbers[0];
    let bot = parsedNumbers[1];

    giveChip(bot, value);
  });
}

function shuffleChips(shufflingInstructions) {
  while (shufflingInstructions.length > 0) {
    let remainingInstructions = [];

    for (let i = 0; i < shufflingInstructions.length; i += 1) {
      let currentInstruction = shufflingInstructions[i];
      let numberTokens = currentInstruction.match(/\d+/g);
      let wordTokens = currentInstruction.match(/bot|output/g);
      let givingBot = numberTokens[0];

      if (!bots[givingBot] || bots[givingBot].length < 2) {
        remainingInstructions.push(currentInstruction);
        continue;
      }

      if (hasValues(givingBot)) lookedForBot = givingBot;

      let low = Math.min(...bots[givingBot]);
      let high = Math.max(...bots[givingBot]);

      processInstruction(low, wordTokens[1], numberTokens[1]);
      processInstruction(high, wordTokens[2], numberTokens[2]);
    }

    shufflingInstructions = remainingInstructions;
  }
}

function processInstruction(chip, receiver, id) {
  if (receiver === 'bot') {
    giveChip(id, chip);
  } else {
    outputs[id] = chip;
  }
}

function giveChip(bot, value) {
  bots[bot] ? bots[bot].push(value) : bots[bot] = [value];
}

function hasValues(bot) {
  let chips = bots[bot];
  return chips.includes(lookedForValues[0]) && chips.includes(lookedForValues[1]);
}

function chomp(text) {
  return text.replace(/(\n)+$/, '');
}

function fileRead(filename) {
  let contents = fs.readFileSync(filename);
  return contents.toString();
}

let fs = require('fs');
let input = fileRead('input.txt');
findBot(input);
// part 1 => 161
// part 2 => 133163
