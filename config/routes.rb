Rails.application.routes.draw do
  resources :user_restaurants
  resources :restaurants
  resources :sessions
  resources :users

  get 'users/:id/prefs', to: "users#prefs"
  get 'users/:id/matches', to: "users#prefs"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
