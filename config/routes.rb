Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  root to: "chats#index"
  resources :chats do
    resources :comments, only: :create
  end
  resources :users, only: :show
  resources :messages, only: [:new, :create]
end
