Rails.application.routes.draw do
  resources :songs
  resources :users
  
  root 'home#index'

  # sign in routes
  get '/sign_in', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy', as: 'delete'

end
