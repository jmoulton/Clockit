require 'rails_helper'
describe Employee do
  let(:employee) { FactoryGirl.create(:employee) }

  describe("#clock_in!") do
    it "returns true and allows an employee to clock in to the system" do
      employee.clocked_in.should == false
      employee.clock_in!.should == true
      employee.clocked_in.should == true
      employee.time_sheets.count.should == 1
    end

    it "returns false if an employee is already clocked in" do
      employee.update_attributes(:clocked_in => true)
      employee.clock_in!.should == false
      employee.clocked_in.should == true
    end
  end
  describe("#clock_out!") do
    it "returns false if employee hasn't clocked in" do
      employee.clocked_in.should == false
      employee.clock_out!.should == false
      employee.clocked_in.should == false
    end

    it "returns true if the employee clocks out and sets clocked_in" do
      employee.update_attributes(:clocked_in => true)
      employee.clock_out!.should == true
      employee.clocked_in.should == false
    end
  end

  describe("#daily_hours") do
    let(:time_sheet_1) { FactoryGirl.create(:time_sheet, 
                                            clocked_in_at: 5.hours.ago.to_time, 
                                            clocked_out_at: 1.hours.ago.to_time,
                                            employee: employee,
                                            hours_worked: 4
                                           ) }
    let(:time_sheet_2) { FactoryGirl.create(:time_sheet, 
                                            clocked_in_at: 12.hours.ago.to_time, 
                                            clocked_out_at: 14.hours.ago.to_time,
                                            employee: employee,
                                            hours_worked: 2
                                           ) }
    it "returns the total hours worked for the given day" do
      employee.time_sheets = [time_sheet_1, time_sheet_2]
      employee.daily_hours.should == 7
    end
  end
end
