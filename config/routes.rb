Rails.application.routes.draw do
  devise_for :users
  get '/' => 'home#home'
  get '/map' => 'home#map'

  get '/chats' => 'chats#index'

  get '/users/:id' => 'users#show'
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

  resources :conversations do 
    resources :messages
  end

  namespace :api do 
    namespace :v1 do 
      get '/users' => 'users#index'
      get '/chat' => 'users#index'
      get '/jams' => 'jams#index'
    end 
  end
end
