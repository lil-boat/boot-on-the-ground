Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get '/testimonials', to: "testimonials#index"
  
  resources :users, only: [:index, :new, :show, :create, :edit]
  resources :sessions, only: [:new]
  resources :projects, only: [:new, :index, :edit, :destroy]
  resources :posts, only: [:new, :index, :edit, :show, :destroy]
  resources :companies, only: [:new, :index, :edit, :destroy]
  resources :jobs, only: [:index, :new, :edit, :destroy]
end
