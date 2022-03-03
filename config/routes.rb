Rails.application.routes.draw do
 resources :organisations, only: [:index, :create, :new]
end
