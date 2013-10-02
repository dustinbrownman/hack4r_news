Hack4rNews::Application.routes.draw do
 resources :posts 
 resources :users
 resources :sessions
 resources :votes
 resources :comments
 
 get 'signup', to: 'users#new', as: 'signup'
 get 'login', to: 'sessions#new', as: 'login'
 get 'logout', to: 'sessions#destroy', as: 'logout'

 root :to => 'posts#index'
end
