module game 

open System
open src.GuessGame

let seed = System.DateTime.Now.ToString("fff") |> int
let target = getRandomNumber(seed)

let inline readGuess _ = Console.WriteLine("Guess a number between 1 and 100"); Console.ReadLine() |> int
let inline display (message: GuessResult) = Console.WriteLine("Your guess was: {0}", message.ToString())

let attempts = playGame(target, readGuess, display)

Console.WriteLine("Congrats you took {0} attempts to guess correctly", attempts)
