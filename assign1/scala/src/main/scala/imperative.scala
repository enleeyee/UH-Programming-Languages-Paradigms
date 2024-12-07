def imperativePerfectNumber(number: Int) =
  var total = 0
  for (i <- 1 until number) {
    if (number % i == 0) {
      total += i
    }
  }
  
  number > 1 && total == number
