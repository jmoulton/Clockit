require 'rails_helper'
describe Employee do
  let(:employee) { FactoryGirl.create(:employee) }
  let(:time_sheet_1) { FactoryGirl.create(:time_sheet, 
                                          employee: employee,
                                          hours_worked: 2
                                         ) }
  let(:time_sheet_2) { FactoryGirl.create(:time_sheet, 
                                          employee: employee,
                                          hours_worked: 1
                                         ) }

  before do
    t = Time.local(2008, 9, 1, 12, 5, 0)
    Timecop.travel(t)
  end

  describe("#clock_in!") do

    it "returns true and allows an employee to clock in to the system" do
      employee.clocked_in.should == false
      employee.clock_in!.should == true
      employee.clocked_in.should == true
      employee.time_sheets.count.should == 1
    end

    it "returns false if an employee is already clocked in" do
      employee.update_attributes(:clocked_in => true)
      time_sheet_1.update_attributes(clocked_in_at: 5.hours.ago, clocked_out_at: 3.hours.ago)
      employee.time_sheets = [time_sheet_1]
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
      time_sheet_1.update_attributes(clocked_in_at: 5.hours.ago, clocked_out_at: 3.hours.ago)
      employee.time_sheets = [time_sheet_1]
      employee.update_attributes(:clocked_in => true)
      employee.clock_out!.should == true
      employee.clocked_in.should == false
    end
  end

  describe("#daily_hours") do
    before do
      time_sheet_1.update_attributes(clocked_in_at: 5.hours.ago, clocked_out_at: 3.hours.ago)
      time_sheet_2.update_attributes(clocked_in_at: 2.hours.ago, clocked_out_at: 1.hours.ago)
    end
    it "returns the total hours worked for the given day" do
      employee.time_sheets = [time_sheet_1, time_sheet_2]
      employee.daily_hours(Date.today).should == 3
    end
  end

  describe "#is_admin?" do
    it "returns true if the employee has admin rank" do
      employee.update_attributes(rank: Employee::RANK[:admin])
      employee.is_admin?.should == true
    end

    it "returns false if the employee does not have admin rank" do
      employee.update_attributes(rank: Employee::RANK[:employee])
      employee.is_admin?.should == false
    end
  end
end
