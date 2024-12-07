module Fibonacci =
    let rec fib (memo: Map<int, bigint>) (position: int) : bigint * Map<int, bigint> =
        if position = 0 || position = 1 then
            1I, memo
        elif memo.ContainsKey(position) then
            memo.[position], memo
        else
            let cur, memoCur = fib memo (position - 1)
            let prev, memoPrev = fib memoCur (position - 2)
            let result = cur + prev 

            result, memoPrev.Add(position, result)

    let calculateFibonacci position =
        let result, _ = fib Map.empty position
        result

[<EntryPoint>]
let main argv =
    let position = 400 
    let result = Fibonacci.calculateFibonacci position
    printfn "Fibonacci number at position %d is %A" position result
    0
