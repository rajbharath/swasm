Rails.application.routes.draw do

  root 'projects#index'
  devise_for :users
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  get 'volunteers', to: 'users#index', as: :volunteers


  resources :users do
    resources :projects, only: [:index, :show]
  end
  resources :projects do
    resources :volunteerships, only: [:create, :destroy]
  end
end
