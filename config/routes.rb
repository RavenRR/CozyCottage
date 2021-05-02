Rails.application.routes.draw do

  root 'sessions#index'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout route
  get 'logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth'
  
  resources :categories, only: [:index, :show]
  resources :appointments
  resources :users do 
    resources :clients, only: [:new, :create, :index]
  end

  resources :clients do
    resources :appointments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
