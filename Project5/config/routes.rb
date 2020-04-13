Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/login'
  # get 'sessions/welcome'
  # get 'users/new'
  # get 'users/create'
  resources :courses

  #routes for login and sign up
  resources :users, only: [:new, :create]
  
  get 'login', to: 'sessions#new'
  get 'login', to: 'sessions#create'
  post 'login', to: 'sessions#create'
  get 'my_page', to: 'sessions#my_page_req_login'
  post 'logout', to: 'sessions#destroy'
  

  #  match '/scrabe', to: 'courses#scrape', via :post, on: :collection
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

   root to: 'courses#index'
   get '/search', to: 'courses#search'
end