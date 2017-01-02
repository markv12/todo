class HabitLogEntry < ActiveRecord::Base
  belongs_to :habit_item
end
