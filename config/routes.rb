Hack4rNews::Application.routes.draw do
 resources :posts, except: [:edit, :update, :destroy]
 resources :users, only: [:new, :create]
 resources :sessions, only: [:new, :create, :destroy]
 resources :votes, only: :create
 resources :comments, except: [:edit, :update, :destroy]
 
 get 'signup', to: 'users#new', as: 'signup'
 get 'login', to: 'sessions#new', as: 'login'
 get 'logout', to: 'sessions#destroy', as: 'logout'

 root :to => 'posts#index'
end
