# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :test
  root 'home#index'
  get 'home/tutorial'
  get 'log/sign_in'
  get 'log/sign_out'
  post 'log/log'
  get 'users/new'
  get 'testing/test_process'
  post 'testing/test_choose'
  get 'testing/index'
end
