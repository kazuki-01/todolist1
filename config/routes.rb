Rails.application.routes.draw do
  root 'home#about'
  
  get "home" => "home#home"
  resource :user
  get '/check' => 'users#check'
  resources :posts
  post '/posts/:id/toggle' => 'posts#toggle'
  get 'withdrawal', to: 'users#withdrawal'
  post 'withdrawal', to: 'users#withdrawal_cerate'

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'update', to: "users#edit"
  patch 'update', to: "users#update"
  delete 'logout' => "sessions#destroy"

  devise_for :users

 
  get "check" => "users#check"


 



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
