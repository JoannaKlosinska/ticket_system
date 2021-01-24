Rails.application.routes.draw do
  resources :events, only: [:show] do
    resources :tickets, only: [:show, :create]
  end
end
