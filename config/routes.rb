Rails.application.routes.draw do
  root to: 'games#new'

  resources :games, only: %i[new create show update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
