# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :expenses
  resources :groups

  resources :groups, only: [] do
    resources :expenses, only: %i[new create destroy]
  end

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  get 'home/index'
  root 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
