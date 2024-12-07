require "date_formatter"

class Integer
  prepend DateFormatter
end

class String
  prepend DateFormatter
end

class Meeting
  def method_missing(detail, *args)
    value = args.length() > 1 ? args : args[0]
    instance_variable_set("@#{detail}", value)
  end

  def duration
    return nil unless @starts && @ends

    start_hour, start_min = @starts.to_s.insert(-3, ':').split(':').map(&:to_i)
    end_hour, end_min = @ends.to_s.insert(-3, ':').split(':').map(&:to_i)

    duration_hours = end_hour - start_hour
    duration_minutes = end_min - start_min

    if duration_minutes < 0
      duration_hours -= 1
      duration_minutes += 60
    end

    "#{duration_hours}h #{duration_minutes}m"
  end

  def to_s
    details = [
      "Meeting: #{@name}",
      @starts ? "start time: #{@starts.to_s.insert(-3, ':')}" : nil,
      @ends ? "end time: #{@ends.to_s.insert(-3, ':')}" : nil,
      duration ? "duration: #{duration}" : nil,
      @on ? "date: #{@on}" : nil,
      @participants ? "number of attendees: #{@participants.length()}" : nil,
    ]

    details.compact.join(", ")
  end
end
