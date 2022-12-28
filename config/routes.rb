# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :users
    resources :test
    root 'home#index'
    get '/inline_pdf/:name' => 'home#inline_pdf', as: :inline_pdf
    get 'log/sign_in'
    get 'log/sign_out'
    post 'log/log'
    get 'log/log'
    get 'users/new'
    get 'testing/test1'
    get 'testing/test_process'
    post 'testing/test_choose'
    post 'testing/set_score_test1'
    post 'testing/set_score_test2'
    get 'testing/index'
  end
end
