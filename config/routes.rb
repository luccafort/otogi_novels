Rails.application.routes.draw do
  resources :authors do
    resources :novels do
      resources :contents
    end
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
