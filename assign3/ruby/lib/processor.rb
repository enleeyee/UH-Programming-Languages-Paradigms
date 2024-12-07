require "meeting"

def schedule(meeting, &block)
  meeting.instance_eval(&block) if block_given?
  meeting.to_s
end

def meeting
  Meeting.new
end
