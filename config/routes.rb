Rails.application.routes.draw do
  devise_for :users
  root to: "chats#index"
  resources :chats do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
