Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/secure'

  resources :user
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :book
end
