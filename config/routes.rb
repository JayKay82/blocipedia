Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      patch :downgrade
    end
  end
  resources :wikis
  resources :charges, only: [:new, :create]

  authenticated :user do
    root to: 'wikis#index', as: 'authenticated_root'
  end

  root to: 'welcome#index'
end
