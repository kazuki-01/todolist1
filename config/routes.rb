Rails.application.routes.draw do
  root 'home#about'
  get "home" => "home#home"

  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "login" => "users#login"
  get "check" => "users#check"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
