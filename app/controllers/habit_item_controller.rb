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
      render json: item, :status => 200, :content_type => 'text/html'
    else
      render :nothing => true, :status => 403, :content_type => 'text/html'
    end
  end

  def log_amount
    no_errors = true
    habit_item = HabitItem.find(params[:id])
    if !params[:amount].nil?
      habit_item.amount_remaining -= params[:amount]
      habit_item.amount_remaining = [0, habit_item.amount_remaining].max
      if habit_item.save()
        new_entry = habit_item.habit_log_entries.new()
        new_entry.amount_logged = params[:amount]
        if !new_entry.save()
          no_errors = false
        end
      else
        no_errors = false
      end
    end

    if no_errors
      render json: habit_item, :status => 200, :content_type => 'text/html'
    else
      render :nothing => true, :status => 403, :content_type => 'text/html'
    end
  end

  def habit_params
    params.permit(:title, :description, :unit_name, :daily_amount, :amount_remaining)
  end
end
