# frozen_string_literal: true

module Web
  module Controllers
    module Registrations
      class Create
        include Web::Action

        params do
          required(:user).schema do
            required(:email).filled(:str?, format?: /@/)
            required(:password).filled(:str?, size?: (8..50))
          end
        end

        def call(params)
          if params.valid?
            UserRepository.new.create(params[:user])

            redirect_to routes.books_path
          else
            self.status = 422
          end
        end
      end
    end
  end
end
