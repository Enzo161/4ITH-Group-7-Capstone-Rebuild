Rails.application.routes.draw do
  root to: 'islands#index'
  
  resources :audit_logs
  devise_for :users, controllers: {
      sessions: 'sessions'
  }
  resources :users do
    member do
      patch :resend_invitation
      post :promote
      post :demote
    end
  end
  resource :two_factor_settings, except: [:index, :show]

  resources :islands do
    resources :regions
  end

  resources :regions do
    resources :clients
  end

  resources :clients do
    resources :deep_wells do 
      member do
        delete :purge_log_attachment
        delete :purge_asbuilt_attachment
        delete :purge_design_attachment
        delete :purge_waterPermit_attachment
        delete :purge_utviFile_attachment
      end
    end
  end

  get '/archive', to: 'deep_wells#archive', as: 'archive'
  get '/show_archive/:id', to: 'deep_wells#show_archive', as: 'show_archive'
  delete '/archive/:id', to: 'deep_wells#permanent_destroy', as: 'destroy_archive'
  put '/archive/:id', to: 'deep_wells#restore', as: 'restore_archive'
end