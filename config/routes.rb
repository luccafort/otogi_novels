Rails.application.routes.draw do
  devise_for :accounts, controllers: {
      :omniauth_callbacks => "accounts/omniauth_callbacks",
      :registrations => "accounts/registrations",
  }

  devise_scope :account do
    get 'sign_in', :to => 'devise/session#new'
    get 'sign_out', :to => 'devise/session#destroy'
  end

  resources :novel_series do
    resources :stories
  end

  resources :authors

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
