class GenerateCalendar < ApplicationService
  def initialize(user)
    @user = user
    @calendar = Icalendar::Calendar.new
  end

  attr_accessor :user, :calendar

  def call
    meetings = user.meetings
    meetings.each do |meeting|
      event = Icalendar::Event.new
      event.dtstart = meeting.time
      event.duration = "P#{meeting.game.max_time}M"
      event.summary  = meeting.name
      event.alarm do |alarm|
        alarm.action  = "DISPLAY"
        alarm.summary = "#{meeting.name} will start in hour"
        alarm.trigger = "-PT60M"
      end
      calendar.add_event(event)
    end
    calendar
  end
end
