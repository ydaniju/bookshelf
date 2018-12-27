# frozen_string_literal: true

module Web
  module Controllers
    module Books
      class Create
        include Web::Action
        include Web::Controllers::AuthenticationHelpers

        params do
          required(:book).schema do
            required(:author).filled(:str?)
            required(:title).filled(:str?)
            required(:user_id).filled(:int?)
            optional(:description).filled(:str?)
          end
        end

        def call(params)
          if params.valid?
            BookRepository.new.create(params[:book])

            redirect_to routes.books_path
          else
            self.status = 422
          end
        end
      end
    end
  end
end
