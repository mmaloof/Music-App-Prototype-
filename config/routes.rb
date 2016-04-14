Rails.application.routes.draw do
  devise_for :users
  get '/' => 'home#index'

  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'

  get '/jams' => 'jams#index'
  get '/jams/new' => 'jams#new'
  post '/jams' => 'jams#create'
  get '/jams/:id' => 'jams#show'
end
