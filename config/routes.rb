InstagramClone::Application.routes.draw do
  
  root to: "posts#index"
  devise_for :users
  resources :posts
    resources :comments
  resources :tags, only: [:show, :destroy]

end