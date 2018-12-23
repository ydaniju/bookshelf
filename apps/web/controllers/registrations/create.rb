# frozen_string_literal: true

module Web
  module Controllers
    module Registrations
      class Create
        include Web::Action

        def call(params)
          UserRepository.new.create(params[:user])

          redirect_to routes.books_path
        end
      end
    end
  end
end
