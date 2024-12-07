package test 

import (
  "assign1/marin_yii/perfectnumber"
  "testing"
)

func TestImperative_is_perfect_number(t *testing.T) {
  test_is_perfect_number(t, perfectnumber.ImperativePerfectNumber)
}

func TestImperative_is_not_perfect_number(t *testing.T) {
  test_is_not_perfect_number(t, perfectnumber.ImperativePerfectNumber)
}
