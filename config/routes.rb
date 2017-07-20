Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get '/testimonials', to: "testimonials#index"

  resources :users, only: [:index, :new, :show, :create, :edit]
  resources :sessions, only: [:new, :create, :destroy]
  resources :projects
  resources :posts do
    resources :likes, only: [:create]
  end
  resources :comments do
    resources :likes, only: [:create]
  end
  resources :companies, only: [:new, :create, :index, :edit, :update, :destroy]
  resources :jobs, only: [:index, :new, :create, :edit, :destroy]
end
