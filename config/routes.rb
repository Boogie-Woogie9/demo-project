# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  root 'home#index'
  get 'log/sign_in'
  get 'log/sign_out'
  post 'log/log'
  get 'users/new'
end
