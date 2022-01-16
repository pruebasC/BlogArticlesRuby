Rails.application.routes.draw do

  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  to: "home#index"
  
  get "/articles/user/:user_id", to: "articles#user"

  get "/articles/new", to: "articles#new", as: :articles_new
  get "/articles/:id", to: "articles#show"
  post "articles", to: "articles#create"
  get "/articles/:id/edit", to: "articles#edit"
  patch "/articles/:id", to:"articles#update", as: :article
  delete "/articles/:id", to:"articles#destroy"
  get "/articles", to: "articles#index", as: :articles_path

end
