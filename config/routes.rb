Rails.application.routes.draw do
  resources :user_restaurants
  resources :restaurants
  resources :sessions
  resources :users

  get 'users/:id/profile', to: "users#profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
