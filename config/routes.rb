Rails.application.routes.draw do
  root 'home#top'

  get "signup" => "users#new"
  get "login" => "users#login"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
