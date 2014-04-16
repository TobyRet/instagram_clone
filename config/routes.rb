InstagramClone::Application.routes.draw do
  
  root to: "posts#index"
  devise_for :users
  resources :tags, only: [:show, :destroy]
  resources :posts do
    resources :comments
  end
  

end