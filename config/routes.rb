Rails.application.routes.draw do
  get 'users/new'
 root to: "pages#home"
 match '/signup', to: 'users#new', via: 'get'
 resources :organisations, only: [:index, :create, :new]
end
