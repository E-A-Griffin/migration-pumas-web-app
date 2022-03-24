Rails.application.routes.draw do
  resources :df1_originals
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "abstract#index"

  root "df1_originals#index"

  resource :city, only: [:show]
  # Defines the root path route ("/")
  # root "articles#index"
end
