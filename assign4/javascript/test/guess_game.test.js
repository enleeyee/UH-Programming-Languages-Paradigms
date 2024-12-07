'use strict';

const { guess,  playGame, getRandomNumber, GuessResult: { LOW, CORRECT, HIGH } } = require('../src/guess_game');

describe('canary test', () => {
  it('should pass a canary test', () => {
    expect(true).toBe(true);
  });
});

describe('guess function', () => {
  it('should return "low" when the guess is less than the target', () => {
    const result = guess(10, 5);

    expect(result).toBe(LOW);
  });

  it('should return "high" when the guess is more than the target', () => {
    const result = guess(10, 15);

    expect(result).toBe(HIGH);
  });

  it('should return "correct" when the guess is the target', () => {
    const result = guess(10, 10);

    expect(result).toBe(CORRECT);
  });
});

describe('playGame takes a target, a function that returns the guess, a function that will display the result', () => {
  it('win on the first attempt', () => {
    const target = 10;
    const messages = [];

    const readGuess = () => target;
    
    const display = (message) => { messages.push(message); };

    const attempts = playGame(target, readGuess, display);

    expect(attempts).toBe(1);
    expect(messages).toEqual([CORRECT]);
  });

  it('win on the second attempt', () => {
    const target = 10;
    const guesses = [3, 10];
    const messages = [];

    const readGuess = () => guesses.shift();
    const display = (message) => { messages.push(message); };

    const attempts = playGame(target, readGuess, display);

    expect(attempts).toBe(2);
    expect(messages).toEqual([LOW, CORRECT]);
  });
  
  it('win on the third attempt', () => {
    const target = 10;
    const guesses = [3, 12, 10];
    const messages = [];

    const readGuess = () => guesses.shift();
    const display = (message) => { messages.push(message); };

    const attempts = playGame(target, readGuess, display);

    expect(attempts).toBe(3);
    expect(messages).toEqual([LOW, HIGH, CORRECT]);
  });
});

describe('get random number', () => {
  it('number is between 1 and 100, inclusive', () => {
    const target = getRandomNumber();

    expect(1 <= target <= 100).toBeTruthy();
  });

  it('number is random', () => {
    const seed1 = 1;
    const target1 = getRandomNumber(seed1);

    const seed2 = 2;
    const target2 = getRandomNumber(seed2);

    expect(target1 !== target2).toBeTruthy();
  });
});
