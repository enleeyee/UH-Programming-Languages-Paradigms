let tailRecursiveFib position =
  let rec fib_list count series =
    if count <= 0 then series 
    else
      let length = List.length series in
      let cur = List.nth series (length - 1) in
      let prev = List.nth series (length - 2) in

      fib_list (count - 1) (series @ [prev + cur]) 
  in
  match position with
    | 0 -> [1]
    | _ -> fib_list (position - 1) [1; 1]
