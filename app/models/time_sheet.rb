class TimeSheet < ActiveRecord::Base
  belongs_to :employee
  CLOCK_IN = "clocked_in"
  CLOCK_OUT = "clocked_out"
end
