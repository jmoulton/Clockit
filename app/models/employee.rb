class Employee < ActiveRecord::Base

  RANK = {
    admin: "admin",
    employee: "employee"
  }

  def clock_in!
    clocked_in ? (return false) : update_attributes(clocked_in: true)
  end

  def clock_out!
    clocked_in ? update_attributes(clocked_in: false) : (return false)
  end

end
