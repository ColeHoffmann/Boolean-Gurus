Rails.application.routes.draw do
  resources :courses

  #  match '/scrabe', to: 'courses#scrape', via :post, on: :collection
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

   root to: 'courses#index'
end
