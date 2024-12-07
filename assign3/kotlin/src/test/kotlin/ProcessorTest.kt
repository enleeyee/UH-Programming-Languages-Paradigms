import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class ProcessorTest {
  @Test
  fun `canary test`() {
    assertTrue(true)
  }

  @Test
  fun `schedule meeting`() {
    val result = schedule meeting {}

    assertEquals(result, "Meeting: ")
  }

  @Test
  fun `able to set meeting name`() {
    val result = schedule meeting {
      with name "Early Admission"
    }

    assertEquals(result, "Meeting: Early Admission")
  }

  @Test
  fun `able to set meeting start`() {
    val result = schedule meeting {
      with name "Early Admission"
      that starts 1030
    }

    assertEquals(result, "Meeting: Early Admission, start time: 10:30")
  }

  @Test
  fun `able to set meeting end`() {
    val result = schedule meeting {
      with name "Early Admission"
      that starts 1030
      and ends 1130
    }

    assertTrue(result.contains("Meeting: Early Admission, start time: 10:30, end time: 11:30"))
  }

  @Test
  fun `able to calculate meeting duration`() {
    val result = schedule meeting {
      with name "Early Admission"
      that starts 1030
      and ends 1130
    }

    assertEquals(result, "Meeting: Early Admission, start time: 10:30, end time: 11:30, duration: 1h 0m")
  }

  @Test
  fun `able to set meeting date`() {
    val result = schedule meeting {
      with name "Early Admission"
      that starts 1030
      and ends 1130
      on date 31 October 2024
    }

    assertEquals(result, "Meeting: Early Admission, start time: 10:30, end time: 11:30, duration: 1h 0m, date: 10/31/2024")
  }

  @Test
  fun `able to set meeting participants`() {
    val result = schedule meeting {
      with name "Early Admission"
      that starts 1030
      and ends 1130
      on date 31 October 2024
      with participants {
        - "Kim R."
        - "Mike B."
        - "Paula P."
        - "Chin Z."
      }
    }

    assertEquals(result, "Meeting: Early Admission, start time: 10:30, end time: 11:30, duration: 1h 0m, date: 10/31/2024, number of participants: 4, participants list: Kim R., Mike B., Paula P., Chin Z.")
  }
}
