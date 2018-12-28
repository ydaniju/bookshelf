# frozen_string_literal: true

root to: 'home#index'
resources :books
resources :registrations, only: %i[new create]
delete '/authentication', to: 'authentication#destroy', as: :authentication
