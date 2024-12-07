import org.scalatest.funsuite.AnyFunSuite

import org.scalatest.prop.TableDrivenPropertyChecks.forAll
import org.scalatest.prop.TableDrivenPropertyChecks.Table

trait perfect_number_test extends AnyFunSuite {

  def testIsPerfectNumber(implementation: Int => Boolean): Unit = {
    val perfectNumbers = Table(
      "number",
      6, 28
    )

    forAll(perfectNumbers) { number =>
      assert(implementation(number), s"Expected $number to be a perfect number")
    }
  }

  def testIsNotPerfectNumber(implementation: Int => Boolean): Unit = {
    val nonPerfectNumbers = Table(
      "number",
      0, 1, 5, 7, 10, 30
    )

    forAll(nonPerfectNumbers) { number =>
      assert(!implementation(number), s"Expected $number not to be a perfect number")
    }
  }
}
