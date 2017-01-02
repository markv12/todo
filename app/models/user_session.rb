class UserSession < Authlogic::Session::Base
  remember_me(true) 
  remember_me_for 5.days
end
