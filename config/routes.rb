Rails.application.routes.draw do
  get 'chatroom/show'
  mount RailsAdmin::Engine => '/nimda', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :inboxes, only: %i[index show] do
    resources :messages, only: :create
  end
  resources :chatrooms, only: :show do
    resources :chatroom_messages, only: :create
  end
  resources :users, only: [:index] do
    member do
      post :follow
      post :unfollow
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
