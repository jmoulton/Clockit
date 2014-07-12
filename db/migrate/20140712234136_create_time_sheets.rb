class CreateTimeSheets < ActiveRecord::Migration
  def change
    create_table :time_sheets do |t|
      t.integer :employee_id
      t.string :clock_type
      t.timestamp :clocked_at

      t.timestamps
    end
  end
end
