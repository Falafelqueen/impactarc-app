Rails.application.routes.draw do
  devise_for :users, controllers: {
  omniauth_callbacks: "users/omniauth_callbacks" }
  root to: "pages#home"
  resources :organisations, only: [:index, :create, :new]
end
