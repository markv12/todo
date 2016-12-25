desc "This task is called by the Heroku scheduler add-on"
task :update_habits => :environment do
  puts "Updating habits..."
  HabitItem.all.each do |habit_item|
  	habit_item.daily_update
  	habit_item.save!
  end
  puts "done."
end