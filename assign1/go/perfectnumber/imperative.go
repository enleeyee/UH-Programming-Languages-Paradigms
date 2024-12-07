package perfectnumber 

func ImperativePerfectNumber(number int) bool {
  total := 0
  for i := 1; i < number; i++ {
      if number % i == 0 {
          total += i
      }
  }

  return number > 1 && total == number
}
