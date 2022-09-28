Rails.application.routes.draw do
  root 'islands#index'
  resources :islands do
    resources :clients
  end
  #resources :deep_wells
  resources :clients do
    resources :deep_wells
  end
end
