Rails.application.routes.draw do
  devise_for :users
  get '/' => 'home#index'
  get '/map' => 'home#map'

  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'

  get '/jams' => 'jams#index'
  get '/jams/new' => 'jams#new'
  post '/jams' => 'jams#create'
  get '/jams/:id' => 'jams#show'
  get '/jams/:id/edit' => 'jams#edit'
  patch '/jams/:id' => 'jams#update'
  delete '/jams/:id' => 'jams#destroy'

  post '/commitments' => 'commitments#create'

  namespace :api do 
    namespace :v1 do 
      get '/users' => 'users#index'
    end 
  end
end
