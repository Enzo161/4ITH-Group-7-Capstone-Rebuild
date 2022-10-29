Rails.application.routes.draw do
  resources :activities
  devise_for :users, controllers: {
      sessions: 'sessions'
  }
  resources :users
  resource :two_factor_settings, except: [:index, :show]
  root to: 'islands#index'

  resources :islands do
    resources :clients
  end
  
  resources :clients do
    resources :deep_wells
  end

end
