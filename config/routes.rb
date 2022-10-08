Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'users/invitations' }

  resources :users
  root to: 'islands#index'

  resources :islands do
    resources :clients
  end
  
  resources :clients do
    resources :deep_wells
  end

end
