require 'rails_helper'

describe TimeSheet, :type => :model do
  let(:employee) { FactoryGirl.create(:employee) }
  let(:time_sheet) { FactoryGirl.create(:time_sheet, clocked_in_at: 5.hours.ago.to_time, employee: employee) }

  describe "#close!" do

    before do
      time_sheet.close!
    end

    it "closes the timesheet and calculates the hours worked" do
      time_sheet.open.should == false
      time_sheet.hours_worked.should == 5
    end
  end
end
