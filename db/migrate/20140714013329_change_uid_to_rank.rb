class ChangeUidToRank < ActiveRecord::Migration
  def change
    rename_column :employees, :uid, :rank
  end
end
