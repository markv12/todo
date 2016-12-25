class HabitItem < ActiveRecord::Base
  belongs_to :user

  def daily_update
  	amount_remaining += daily_amount
  end
end
