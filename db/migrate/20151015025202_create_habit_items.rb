class CreateHabitItems < ActiveRecord::Migration
  def change
    create_table :habit_items do |t|
      t.belongs_to :user
      t.text :title
      t.text :description
      t.string :unit_name
      t.decimal :daily_amount, precision: 10, scale: 3
      t.decimal :amount_remaining, precision: 10, scale: 3
      t.datetime :last_amount_increase
      t.timestamps
    end
  end
end
