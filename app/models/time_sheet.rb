class TimeSheet < ActiveRecord::Base
  belongs_to :employee
  CLOCK_IN = "clocked_in"
  CLOCK_OUT = "clocked_out"

  def close!
    hours = ((Time.now - clocked_in_at) / 1.hour).round
    update_attributes(open: false, hours_worked: hours, clocked_out_at: Time.now)
  end
end
