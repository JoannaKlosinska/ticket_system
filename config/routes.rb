Rails.application.routes.draw do
  resources :events, only: [:show] do
    resources :tickets, only: [:index, :create]
  end
end
