class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.belongs_to :user
      t.text :title
      t.text :description
      t.boolean :completed, default: false
      t.datetime :completed_at
      t.timestamps
    end
  end
end
