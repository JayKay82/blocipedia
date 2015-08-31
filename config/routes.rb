Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :update]
  resources :wikis

  authenticated :user do
    root to: 'wikis#index', as: 'authenticated_root'
  end

  root to: 'welcome#index'
end
