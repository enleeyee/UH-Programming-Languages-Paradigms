def functionalPerfectNumber(number: Int) =
  number > 0 && (1 until number).filter(number % _ == 0).sum == number
