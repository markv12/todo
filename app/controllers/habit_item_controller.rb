class HabitItemController < ApplicationController

  def create
    item = current_user.habit_items.new(habit_params)
    item.amount_remaining = item.daily_amount
    if item.save()
      render json: item, :status => 200, :content_type => 'text/html'
    else
      render :nothing => true, :status => 403, :content_type => 'text/html'
    end
  end

  def delete
    item = HabitItem.find(params[:id])
    if item.destroy
      render json: item, :status => 200, :content_type => 'text/html'
    else
      render :nothing => true, :status => 500, :content_type => 'text/html'
    end
  end

  def update_habit
    item = HabitItem.find(params[:id]);
    if item.update(habit_params)
      render :nothing => true, :status => 200, :content_type => 'text/html'
    else
      render :nothing => true, :status => 403, :content_type => 'text/html'
    end
  end

  def log_amount
    habit_item = HabitItem.find(params[:id])
    habit_item.amount_remaining -= params[:amount]
    if habit_item.save()
      render json: habit_item, :status => 200, :content_type => 'text/html'
    else
      render :nothing => true, :status => 403, :content_type => 'text/html'
    end
  end

  def habit_params
    params.permit(:title, :description, :unit_name, :daily_amount, :amount_remaining)
  end

end
