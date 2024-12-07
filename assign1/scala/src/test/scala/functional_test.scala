class functional_test extends perfect_number_test {

  test("Functional: is perfect number") {
    testIsPerfectNumber(functionalPerfectNumber)
  }

  test("Functional: is not perfect number") {
    testIsNotPerfectNumber(functionalPerfectNumber)
  }
}
