Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"

  resources :users, only: [:edit, :update]
  resources :messages, only: [:index, :create]
  resources :groups, only: [:new, :create, :edit, :update]
end
