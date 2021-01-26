Rails.application.routes.draw do
  resources :events, only: [:show] do
    resources :tickets, only: [:index, :create]
  end
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  post '/login', to: 'authentication#login'
end
