Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/ayuda', to: 'pages#help', as: 'ayuda'
<<<<<<< HEAD
=======
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
>>>>>>> 99a38d0dd9a1a2f33df375fb3283d147daae9405
  resources :users, only: [:show, :index, :create, :new, :edit, :update] do
    resources :appointments, only: [:index, :show]
    resources :reviews, only: [:show, :index]
    get '/profile', to: 'users#profile', as: 'profile' 
  end

  resources :appointments, only: [:edit, :update, :index, :show] do
    resources :reviews, only: [:new, :create, :edit, :update]
  end
end
