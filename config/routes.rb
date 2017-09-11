Rails.application.routes.draw do
  devise_for :accounts, :controllers => { :omniauth_callbacks => "accounts/omniauth_callbacks" }

  devise_scope :account do
    get 'sign_in', :to => 'devise/session#new', :as => :new_account_session
    get 'sign_out', :to => 'devise/session#destroy', :as => :destroy_account_session
  end

  resources :novels do
    resources :contents
  end

  resources :authors

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
