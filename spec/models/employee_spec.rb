require 'rails_helper'
describe Employee do
  let(:employee) { FactoryGirl.create(:employee) }

  describe("#clock_in!") do
    it "returns true and allows an employee to clock in to the system" do
      employee.clocked_in.should == false
      employee.clock_in!.should == true
      employee.clocked_in.should == true
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
end
