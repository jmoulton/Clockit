class ChangeStatusToClockedIn < ActiveRecord::Migration
  def up
    remove_column :employees, :status
    add_column :employees, :clocked_in, :boolean, default: false
  end

  def down
    remove_column :employees, :clocked_in
    add_column :employees, :status, :string
  end
end
