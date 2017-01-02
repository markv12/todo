class HabitItem < ActiveRecord::Base
  belongs_to :user
  has_many :habit_log_entries

  def daily_update
  	self.amount_remaining += self.daily_amount
  end
end
