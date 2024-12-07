let iterativeFib position =
  let fib_iter (prev, cur) _ = (cur, prev + cur) in

  let fibs = List.init (position + 1) (fun pos -> 
    if pos = 0 then 
      (1, 1)
    else 
      List.fold_left fib_iter (1, 1) (List.init pos (fun _ -> ()))
      ) in

  List.map fst fibs
