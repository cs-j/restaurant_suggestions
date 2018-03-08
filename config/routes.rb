Rails.application.routes.draw do
  # resources :user_restaurants
  resources :restaurants, only: [:index, :show]
  resources :users, except: [:edit]
  # resources :sessions

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get 'search', to: 'users#edit', as: :search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
