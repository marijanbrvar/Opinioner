Rails.application.routes.draw do

  get 'register', to: 'registrations#new'
  post 'register', to: 'registrations#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  # resources :opinion, only: %i[new create] do
  #   resources :likes
  # end
  get 'opinion', to: 'opinions#new'
  post 'opinion', to: 'opinions#create'

  get 'opinion/:id/like', to: 'opinions#like', as: 'like'
  
  get 'discover', to: 'main#discover'

  get 'profile/:id', to: 'main#profile', as: 'profile'

  get 'follow/:id', to: 'main#follow', as: 'follow'
  delete 'follow/:id', to: 'main#destroy'
  resources :main, only: %i[index follow destroy]
  root to: 'sessions#new'
end
