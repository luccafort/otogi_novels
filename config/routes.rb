Rails.application.routes.draw do
  devise_for :accounts
  resources :novels do
    resources :contents
  end

  resources :authors

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
