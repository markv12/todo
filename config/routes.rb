Rails.application.routes.draw do
  root 'front_page#index'

  get '/me', to: 'users#show'
  get '/user_graph', to:'users#graph', as: 'user_graph'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'

  put '/todo_item/:id', to:'todo_item#update'
  post '/todo_item', to:'todo_item#create'
  delete '/todo_item/:id', to:'todo_item#delete'

  post '/habit_item', to:'habit_item#create'
  delete '/habit_item/:id', to:'habit_item#delete'
  put '/habit_item/:id', to:'habit_item#update_habit'

  resources :user_sessions
  get '/logout', to: 'user_sessions#destroy', as: 'destroy_user_session'
end
