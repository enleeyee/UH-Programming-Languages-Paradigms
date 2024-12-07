namespace test

open System
open NUnit.Framework
open src.GuessGame

[<TestFixture>]
type GuessGameTest () =

  [<Test>]
  member this.CanaryTest() =
    Assert.That(true, Is.True)

  [<Test>]
  member this.GuessFunctionLOW() =
    let result = guess 10 5

    Assert.That(result, Is.EqualTo(GuessResult.LOW))
        
  [<Test>]
  member this.GuessFunctionHIGH() =
    let result = guess 10 15

    Assert.That(result, Is.EqualTo(GuessResult.HIGH))

  [<Test>]
  member this.GuessFunctionCORRECT() =
    let result = guess 10 10

    Assert.That(result, Is.EqualTo(GuessResult.CORRECT))

  [<Test>]
  member this.playGameWinOnFirstAttempt() =
    let target = 10
    let messages = ResizeArray<GuessResult>() 

    let inline readGuess _ = 10
    let inline display message = messages.Add message

    let attempts = playGame(target, readGuess, display)

    Assert.That(messages.ToArray(), Is.EqualTo([|GuessResult.CORRECT|]))

  [<Test>]
  member this.playGameWinOnSecondAttempt() =
    let target = 10
    let mutable inputs = [|5; 10|]
    let messages = ResizeArray<GuessResult>() 

    let inline readGuess _ = 
      let guess = inputs.[0]
      inputs <- inputs.[1..]
      guess

    let inline display message = messages.Add message

    let attempts = playGame(target, readGuess, display)

    Assert.That(messages.ToArray(), Is.EqualTo([|GuessResult.LOW; GuessResult.CORRECT|]))

  [<Test>]
  member this.playGameWinOnThirdAttempt() =
    let target = 10
    let mutable inputs = [|5; 15; 10|]
    let messages = ResizeArray<GuessResult>() 

    let inline readGuess _ = 
      let guess = inputs.[0]
      inputs <- inputs.[1..]
      guess

    let inline display message = messages.Add message

    let attempts = playGame(target, readGuess, display)

    Assert.That(messages.ToArray(), Is.EqualTo([|GuessResult.LOW; GuessResult.HIGH; GuessResult.CORRECT|]))

  [<Test>]
  member this.numberBetween1And100() =
    let seed = 42
    let target = getRandomNumber(seed) 

    Assert.That(target, Is.GreaterThanOrEqualTo(1).And.LessThanOrEqualTo(100))

  [<Test>]
  member this.numberIsRandom() =
    let seed1 = 1
    let target1 = getRandomNumber(seed1)

    let seed2 = 2
    let target2 = getRandomNumber(seed2)

    Assert.That(target1, Is.Not.EqualTo(target2))
