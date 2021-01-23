Rails.application.routes.draw do
  root to: 'events#show'

  resources :events, only: [:show]
end
