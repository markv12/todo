class User < ActiveRecord::Base
  has_many :habit_items
  has_many :todo_items

  acts_as_authentic do |c|
    c.login_field = :email
  end

end
