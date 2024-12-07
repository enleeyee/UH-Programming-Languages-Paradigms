package test

import (
  "testing"
)

func Test_Canary(t *testing.T){
}

func test_is_perfect_number(t *testing.T, implementation func(number int) bool) {
  tests := []struct {
		number int
	}{
		{6},
		{28},
	}

	for _, tt := range tests {
    t.Run("Imperative: is perfect number", func(t *testing.T) {
			if got := implementation(tt.number); got != true {
				t.Errorf("Imperative_perfect_number(%v) = %v, want %v", tt.number, got, true)
			}
		})
	}
}

func test_is_not_perfect_number(t *testing.T, implementation func(number int) bool) {
  tests := []struct {
		number int
	}{
    {0},
    {1},
    {5},
    {7},
    {10},
    {30},
	}

	for _, tt := range tests {
    t.Run("Imperative: is not perfect number", func(t *testing.T) {
			if got := implementation(tt.number); got != false {
				t.Errorf("Imperative_perfect_number(%v) = %v, want %v", tt.number, got, false)
			}
		})
	}
}
