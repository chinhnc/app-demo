Rails.application.routes.draw do
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :microposts do
    resources :comments
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :likes
  resources :comments, only: [:create, :destroy]
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  post 'signup' => 'users#new'
  get 'home' => 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => "static_pages#contact"
  root 'static_pages#home'
end
