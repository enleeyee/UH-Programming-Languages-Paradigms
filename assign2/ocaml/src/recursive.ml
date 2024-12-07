let rec recursiveFib position =
  match position with
  | 0 -> [1]
  | 1 -> [1; 1]
  | _ ->
      let series = recursiveFib (position - 1) in
      let length = List.length series in
      let cur = List.nth series (length - 1) in
      let prev = List.nth series (length - 2) in
      series @ [prev + cur]
