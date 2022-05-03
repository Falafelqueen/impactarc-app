Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users, controllers: {
  omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: [:show] do
    member do
      get :unsave_organisation
    end
  end
  resources :user_organisations, only: [:index, :destroy]
  resources :organisations, only: [:index, :create, :new, :show] do
    member do
      get :save_organisation
      get :unsave_organisation
    end
  end
end
