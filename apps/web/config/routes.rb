# frozen_string_literal: true

root to: 'home#index'
resources :books
resources :registrations, only: %i[new create]
resource :authentication, only: %i[new create destroy]
