import Meeting

infix fun String.meeting(block: Meeting.() -> Unit): String {
  val meeting = Meeting()
  meeting.block()
  return meeting.details()
}

val schedule = ""
