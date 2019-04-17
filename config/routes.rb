Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: 'phrases#index', as: :root

  resources :phrases do
    member do
      post :vote
    end
    resources :examples, only: [:create, :destroy] do
      post :vote
    end
  end

  resources :notification, only: :index do
    collection do
      put :read_all
    end
  end

  resources :users

end
