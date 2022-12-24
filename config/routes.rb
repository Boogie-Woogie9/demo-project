Rails.application.routes.draw do
  get 'log/sign_in'
  get 'log/sign_out'
  root "home#index"
end
