class Meeting {
  val with = this
  val that = this
  val and = this
  val on = this

  var name: String? = null
  var starts: Int? = null
  var ends: Int? = null
  var duration: String? = null
  var date: String? = null
  val participants = mutableListOf<String>()

  private var day: Int? = null

  infix fun name(name: String) {
    this.name = name
  }

  infix fun starts(time: Int) {
    this.starts = time
  }

  infix fun ends(time: Int) {
    this.ends = time
    this.duration = duration()
  }

  infix fun date(day: Int): Meeting {
    this.day = day
    return this
  }

  infix fun participants(block: MutableList<String>.() -> Unit) {
    participants.apply(block)
  }

  operator fun String.unaryMinus() {
    participants.add(this)
  }

  fun formatTime(time: Int): String {
    val hours = time / 100
    val minutes = time % 100
    return String.format("%02d:%02d", hours, minutes)
  }

  fun duration(): String? {
    if (starts == null || ends == null) return null

    val (startHour, startMin) = starts.toString().padStart(4, '0').chunked(2).map { it.toInt() }
    val (endHour, endMin) = ends.toString().padStart(4, '0').chunked(2).map { it.toInt() }

    var durationHours = endHour - startHour
    var durationMinutes = endMin - startMin

    if (durationMinutes < 0) {
        durationHours -= 1
        durationMinutes += 60
    }

    return "${durationHours}h ${durationMinutes}m"
  }

  infix fun January(year: Int) { if (day != null) this.date = "01/${day.toString().padStart(2, '0')}/$year" }
  infix fun February(year: Int) { if (day != null) this.date = "02/${day.toString().padStart(2, '0')}/$year" }
  infix fun March(year: Int) { if (day != null) this.date = "03/${day.toString().padStart(2, '0')}/$year" }
  infix fun April(year: Int) { if (day != null) this.date = "04/${day.toString().padStart(2, '0')}/$year" }
  infix fun May(year: Int) { if (day != null) this.date = "05/${day.toString().padStart(2, '0')}/$year" }
  infix fun June(year: Int) { if (day != null) this.date = "06/${day.toString().padStart(2, '0')}/$year" }
  infix fun July(year: Int) { if (day != null) this.date = "07/${day.toString().padStart(2, '0')}/$year" }
  infix fun August(year: Int) { if (day != null) this.date = "08/${day.toString().padStart(2, '0')}/$year" }
  infix fun September(year: Int) { if (day != null) this.date = "09/${day.toString().padStart(2, '0')}/$year" }
  infix fun October(year: Int) { if (day != null) this.date = "10/${day.toString().padStart(2, '0')}/$year" }
  infix fun November(year: Int) { if (day != null) this.date = "11/${day.toString().padStart(2, '0')}/$year" }
  infix fun December(year: Int) { if (day != null) this.date = "12/${day.toString().padStart(2, '0')}/$year" }


  fun details(): String {
    val details = listOf(
      "Meeting: ${name ?: ""}",
      starts?.let { "start time: ${formatTime(it)}" },
      ends?.let { "end time: ${formatTime(it)}" },
      duration?.let { "duration: ${it}" },
      date?.let { "date: ${it}" },
      participants.takeIf { it.isNotEmpty() }?.let { "number of participants: ${it.size}" },
      participants.takeIf { it.isNotEmpty() }?.let { "participants list: ${it.joinToString(", ")}" },
    )
    return details.filterNotNull().joinToString(", ")
  }
}
