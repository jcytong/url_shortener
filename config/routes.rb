Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  root 'links#index'

  resources :links, only: [:create]
  get ':short_url', to: 'links#redirect', as: :short
end
