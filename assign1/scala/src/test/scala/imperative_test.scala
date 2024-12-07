class imperative_test extends perfect_number_test {
  
  test("Canary test") {
    assert(true)
  }

  test("Imperative: is perfect number") {
    testIsPerfectNumber(imperativePerfectNumber)
  }

  test("Imperative: is not perfect number") {
    testIsNotPerfectNumber(imperativePerfectNumber)
  }
}
