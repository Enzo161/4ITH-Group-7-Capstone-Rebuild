Rails.application.routes.draw do
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
  root to: 'islands#index'

  resources :islands do
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

end