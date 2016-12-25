class HabitItem < ActiveRecord::Base
  belongs_to :user

  def daily_update
  	self.amount_remaining += self.daily_amount
  end
end
