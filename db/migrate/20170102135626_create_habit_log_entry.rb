class CreateHabitLogEntry < ActiveRecord::Migration
  def up
    create_table :habit_log_entries do |t|
      t.belongs_to :habit_item
      t.decimal :amount_logged, precision: 10, scale: 3
      t.timestamps
    end
  end

  def down
  	drop_table :habit_log_entries
  end
end
