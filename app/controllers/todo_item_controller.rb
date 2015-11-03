class TodoItemController < ApplicationController

  def create
    item = current_user.todo_items.new(todo_params)
    if item.save()
      render :nothing => true, :status => 200, :content_type => 'text/html'
    else
      render :nothing => true, :status => 403, :content_type => 'text/html'
    end
  end

  def update
    item = TodoItem.find(params[:id])
    if item.update(todo_params)
      render :nothing => true, :status => 200, :content_type => 'text/html'
    else
      render :nothing => true, :status => 403, :content_type => 'text/html'
    end
  end

  def delete
    item = TodoItem.find(params[:id])
    if item.destroy
      render :nothing => true, :status => 200, :content_type => 'text/html'
    else
      render :nothing => true, :status => 500, :content_type => 'text/html'
    end
  end

  def todo_params
    params.permit(:title, :description, :completed, :completed_at)
  end

end
