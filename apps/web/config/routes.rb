# frozen_string_literal: true

root to: 'home#index'
resources :books, only: [:index, :new, :create]
