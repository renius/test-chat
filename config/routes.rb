Rails.application.routes.draw do
  resources :sessions, only: %i(create)
  resources :users, only: %i(create)
end
