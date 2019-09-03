Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dashboard', to: 'dashboard#show', as: :dashboard

  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  get '/facebook/login', to: 'facebook/sessions#new', as: :facebook_login
  get '/gmail/login', to: 'gmail/sessions#new', as: :gmail_login

  resources :users, only: [:create]
end
