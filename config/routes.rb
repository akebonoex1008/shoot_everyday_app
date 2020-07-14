Rails.application.routes.draw do

  root to: 'home#index'
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords"
  }

  resources :users, :only => [:index, :show] do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
  resources :posts, only: [:index, :new, :create, :destroy]
  resources :likes, only: [:create, :destroy]

end
