Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get '/testimonials', to: "testimonials#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:index, :new, :show, :create, :edit]
  # resources :sessions, only: [:new, :create, :destroy]
  resources :projects
  resources :posts do
    resources :likes, only: [:create]
  end
  resources :comments, only: [:create, :edit, :destroy] do
    resources :likes, only: [:create]
  end
  resources :companies, only: [:new, :create, :index, :edit, :update, :destroy]
  resources :jobs, only: [:index, :new, :create, :edit, :destroy]
end
