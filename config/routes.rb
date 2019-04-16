Rails.application.routes.draw do
  root to: 'phrases#index', as: :root_path

  resources :phrases

end
