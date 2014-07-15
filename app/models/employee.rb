class Employee < ActiveRecord::Base

  has_many :time_sheets

  RANK = {
    admin: "admin",
    employee: "employee"
  }

  def clock_in!
    clocked_in ? (return false) : update_attributes(clocked_in: true)
    TimeSheet.create(employee: self, clocked_in_at: Time.now)
    true
  end

  def clock_out!
    clocked_in ? update_attributes(clocked_in: false) : (return false)
    time_sheet = time_sheets.open.first
    time_sheet.close!
    true
  end

end
