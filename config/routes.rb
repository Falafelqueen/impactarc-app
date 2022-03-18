Rails.application.routes.draw do
 root to: "pages#home"
 resources :organisations, only: [:index, :create, :new]
end
