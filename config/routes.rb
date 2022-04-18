Rails.application.routes.draw do
 root to: "pages#home"
 resources :users
 match '/signup', to: 'users#new', via: 'get'
 resources :organisations, only: [:index, :create, :new]

end
