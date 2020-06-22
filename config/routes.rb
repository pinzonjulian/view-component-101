Rails.application.routes.draw do
  resources :locations
  resources :parties do
    resources :invitations
  end
  resources :users
  root to: 'static#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
