Rails.application.routes.draw do
  resources :projects, only: [:index, :create, :update, :destroy, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
