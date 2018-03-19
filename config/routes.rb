Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/secure'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :books do
    member do
      get 'borrow', to: 'books/borrow_book'
      get 'return', to: 'books/return_book'
    end
    resource :loans
  end

  resources :authors, only: :show
  resources :comments
end
