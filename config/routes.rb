Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root "chats#index"
  resources :chats do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  resources :messages, only: [:index, :create]
end
