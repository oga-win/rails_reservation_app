Rails.application.routes.draw do
  get 'rooms/posts'
  get 'users/profile' => "users#show"
  root 'home#index'

  devise_for :users
  resources :rooms
  resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
