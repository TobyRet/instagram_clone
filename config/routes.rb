InstagramClone::Application.routes.draw do
  
  get 'maps/show'

  root to: "posts#index"
  devise_for :users
  resources :tags, only: [:show, :destroy]
  

  resources :posts do
    resources :comments
    resources :charges
    resource :map
  end
  

end