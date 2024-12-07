package perfectnumber

import (
	"github.com/repeale/fp-go"
)

func FunctionalPerfectNumber(number int) bool {
	if number <= 0 {
		return false
	}
  
  nums := fp.FlatMapWithIndex(func(_ int, index int) []int {
    return []int{index + 1}
  })(make([]int, number - 1))

	divisors := fp.Filter(func(i int) bool { return number%i == 0 })(nums)
  
	return fp.Reduce(func(acc int, curr int) int { return acc + curr }, 0)(divisors) == number
}
