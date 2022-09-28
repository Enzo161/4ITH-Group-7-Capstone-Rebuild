Rails.application.routes.draw do
  resources :deep_wells
  resources :clients
  resources :islands
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
