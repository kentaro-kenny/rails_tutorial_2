Rails.application.routes.draw do
  get 'likes/create'

  get 'likes/destroy'

  get 'password_resets/new'

  get 'password_resets/edit'

  root "static_pages#home"
  get '/help', to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get '/signup', to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  #micropostは削除しました
  resources :relationships,       only: [:create, :destroy]
  
  #like拡張機能
  resources :microposts do
    resources :likes, only: [:create, :destroy]
  end
  
end
