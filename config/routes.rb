Rails.application.routes.draw do
  get 'about', to: 'about#index'

  get 'register', to: 'registrations#new'
  post 'register', to: 'registrations#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  root to: 'main#index'
end
