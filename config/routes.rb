Rails.application.routes.draw do
  resources :usermanages
  devise_for :users
  resources :users
  root to: 'islands#index'
  resources :islands do
    resources :clients
  end
  #resources :deep_wells
  resources :clients do
    resources :deep_wells
  end
end
