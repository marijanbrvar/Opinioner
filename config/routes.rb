Rails.application.routes.draw do

  get 'register', to: 'registrations#new'
  post 'register', to: 'registrations#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  get 'opinion', to: 'opinions#new'
  post 'opinion', to: 'opinions#create'
  
  get 'discover', to: 'main#discover'
  get 'profile', to: 'main#profile'

  get 'follow/:id/follow', to: 'main#follow', as: 'follow'
  root to: 'main#index'
end
