Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: 'phrases#index', as: :root

  resources :phrases do
    resources :examples, only: [:create, :destroy]
  end

  resources :users

end
