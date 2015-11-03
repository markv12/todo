class HabitItemController < ApplicationController

  def update_habit
    item = HabitItem.find(params[:id]);
    if item.update(habit_params)
      render :nothing => true, :status => 200, :content_type => 'text/html'
    else
      render :nothing => true, :status => 403, :content_type => 'text/html'
    end
  end

  def habit_params
    params.permit(:title, :description, :unit_name, :daily_amount, :amount_remaining)
  end

end
