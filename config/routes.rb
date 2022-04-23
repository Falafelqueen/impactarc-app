Rails.application.routes.draw do
  devise_for :users, controllers: {
  omniauth_callbacks: "users/omniauth_callbacks" }
  root to: "pages#home"
  resources :users, only: [:show]
  resources :user_organisations, only: [:index, :destroy]
  resources :organisations, only: [:index, :create, :new] do
    member do
      get :save_organisation
      get :unsave_organisation
    end
  end
end
