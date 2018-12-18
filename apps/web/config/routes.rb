# frozen_string_literal: true

root to: 'home#index'
resources :books, except: %i[delete]
