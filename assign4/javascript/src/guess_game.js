'use strict';

const _ = require('lodash');
const seedrandom = require('seedrandom');

const GuessResult = {
  LOW: 'LOW',
  CORRECT: 'CORRECT',
  HIGH: 'HIGH',
};

function guess(target, guess) {
  return [GuessResult.LOW, GuessResult.CORRECT, GuessResult.HIGH][Math.sign(guess - target) + 1];
}

function playGame(target, readGuess, display) {
  return _(_.range(1, 1000))
    .map(attempt => [attempt, readGuess()])
    .map(([attempt, aGuess]) => [attempt, guess(target, aGuess)])
    .map(([attempt, result]) => [attempt, display(result) || result])
    .find(([attempt, result]) => result === GuessResult.CORRECT)[0];
}

function getRandomNumber(seed) {
  return Math.floor(seedrandom(seed)() * 100) + 1;
}

module.exports = { guess, playGame, getRandomNumber, GuessResult };
