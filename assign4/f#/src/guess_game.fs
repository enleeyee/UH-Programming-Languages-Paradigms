namespace src

open System

module GuessGame =
  type GuessResult =
    | LOW
    | HIGH 
    | CORRECT

  let guess (target: int) (guess: int) = 
    [|GuessResult.LOW; GuessResult.CORRECT; GuessResult.HIGH|].[Math.Sign(guess - target) + 1]

  let playGame (target: int, readGuess: unit -> int, display: GuessResult -> unit) : int =
    Seq.initInfinite ((+) 1)
    |> Seq.map (fun attempt -> attempt, readGuess())
    |> Seq.map (fun (attempt, userGuess) -> attempt, (guess target userGuess))
    |> Seq.map (fun (attempt, result) -> display result; (attempt, result))
    |> Seq.find (fun (_, result) -> result = GuessResult.CORRECT)
    |> fst

  let getRandomNumber (seed: int) =
    Random(seed).Next(1, 101)
    