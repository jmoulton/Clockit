class ChangeTimeSheetObject < ActiveRecord::Migration
  def up
    remove_column :time_sheets, :clocked_at
    remove_column :time_sheets, :clock_type
    add_column :time_sheets, :clocked_in_at, :timestamp
    add_column :time_sheets, :clocked_out_at, :timestamp
    add_column :time_sheets, :hours_worked, :integer
    add_column :time_sheets, :open, :boolean, :default => true
  end

  def down
    remove_column :time_sheets, :clocked_in_at
    remove_column :time_sheets, :clocked_out_at
    remove_column :time_sheets, :open
    remove_column :time_sheets, :hours_worked
    add_column :time_sheets, :clocked_at, :timestamp
    add_column :time_sheets, :clock_type, :string
  end
end
