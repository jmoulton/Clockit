# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
employees = [
  {employee: { first_name: "Phillip", last_name: "Fry", rank: "employee" }, time_sheets: [
    {hours_worked: 2, clocked_in_at: 80.hours.ago.to_time, clocked_out_at: 78.hours.ago.to_time, open: false},
    {hours_worked: 8, clocked_in_at: 62.hours.ago.to_time, clocked_out_at: 50.hours.ago.to_time, open: false},
    {hours_worked: 8, clocked_in_at: 38.hours.ago.to_time, clocked_out_at: 30.hours.ago.to_time, open: false},
    {hours_worked: 8, clocked_in_at: 20.hours.ago.to_time, clocked_out_at: 12.hours.ago.to_time, open: false}
    ]
  },
  {employee: { first_name: "Terronga", last_name: "Leela", rank: "admin" }, time_sheets: [
    {hours_worked: 2, clocked_in_at: 92.hours.ago.to_time, clocked_out_at: 90.hours.ago.to_time, open: false},
    {hours_worked: 10, clocked_in_at: 60.hours.ago.to_time, clocked_out_at: 50.hours.ago.to_time, open: false},
    {hours_worked: 4, clocked_in_at: 22.hours.ago.to_time, clocked_out_at: 18.hours.ago.to_time, open: false},
    {hours_worked: 3, clocked_in_at: 5.hours.ago.to_time, clocked_out_at: 2.hours.ago.to_time, open: false}
    ]
  },
  {employee: { first_name: "Professor", last_name: "Farnsworth", rank: "admin"}, time_sheets: [
    {hours_worked: 2, clocked_in_at: 120.hours.ago.to_time, clocked_out_at: 118.hours.ago.to_time, open: false},
    {hours_worked: 10, clocked_in_at: 100.hours.ago.to_time, clocked_out_at: 90.hours.ago.to_time, open: false},
    {hours_worked: 10, clocked_in_at: 40.hours.ago.to_time, clocked_out_at: 30.hours.ago.to_time, open: false},
    {hours_worked: 3, clocked_in_at: 20.hours.ago.to_time, clocked_out_at: 17.hours.ago.to_time, open: false}
    ]
  },
  {employee: { first_name: "Bender", last_name: "Rodriguez", rank: "employee" }, time_sheets: [
    {hours_worked: 1, clocked_in_at: 2.hours.ago.to_time, clocked_out_at: 1.hours.ago.to_time, open: false}
    ]
  },
  {employee: { first_name: "Dr", last_name: "Zoidberg", rank: "employee" }, time_sheets: [
    {hours_worked: 12, clocked_in_at: 90.hours.ago.to_time, clocked_out_at: 78.hours.ago.to_time, open: false},
    {hours_worked: 20, clocked_in_at: 40.hours.ago.to_time, clocked_out_at: 20.hours.ago.to_time, open: false},
    {hours_worked: 8, clocked_in_at: 38.hours.ago.to_time, clocked_out_at: 30.hours.ago.to_time, open: false},
    {hours_worked: 8, clocked_in_at: 20.hours.ago.to_time, clocked_out_at: 12.hours.ago.to_time, open: false}
    ]
  },
  {employee: { first_name: "Amy", last_name: "Wong", rank: "employee"}, time_sheets: [
    {hours_worked: 2, clocked_in_at: 80.hours.ago.to_time, clocked_out_at: 78.hours.ago.to_time, open: false},
    {hours_worked: 8, clocked_in_at: 62.hours.ago.to_time, clocked_out_at: 50.hours.ago.to_time, open: false},
    {hours_worked: 8, clocked_in_at: 38.hours.ago.to_time, clocked_out_at: 30.hours.ago.to_time, open: false},
    {hours_worked: 8, clocked_in_at: 20.hours.ago.to_time, clocked_out_at: 12.hours.ago.to_time, open: false}
    ]
  }
]

unless Employee.count > 0
  employees.each do |e|
    employee = Employee.create(e[:employee])
    e[:time_sheets].each do |t|
      employee.time_sheets << TimeSheet.create(t)
    end
  end
end
