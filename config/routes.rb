Rails.application.routes.draw do
  resources :activities
  devise_for :users
  resources :users
  root to: 'islands#index'

  resources :islands do
    resources :clients
  end
  
  resources :clients do
    resources :deep_wells
  end

end
