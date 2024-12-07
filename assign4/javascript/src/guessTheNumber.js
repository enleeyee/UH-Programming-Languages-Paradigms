'use strict';

const { getRandomNumber, playGame } = require('./guess_game.js');
const prompt = require('prompt-sync')({ sigint: true });

const target = getRandomNumber(Date.now());
const readGuess = () => prompt('Guess a number between 1 and 100: ');
const display = (result) => { console.log('Your guess was: ' + result.toLowerCase()); };

const attempts = playGame(target, readGuess, display);

console.log('Congrats you took ' + attempts + ' attempts to guess correctly');
