Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/ayuda', to: 'pages#help' as: 'ayuda'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources: users, only: [:show, :index, :create, :new, :edit, :update] do
    resources: appointments, only: [:index, :show]
    resources: reviews, only: [:show, :index]
    get '/profile', to: 'users#profile' as: 'profile' 
  end

  resources: appointments, only: [:edit, :update, :index, :show] do
    resources: reviews, only: [:new, :create, :edit, :update]
  end
end
