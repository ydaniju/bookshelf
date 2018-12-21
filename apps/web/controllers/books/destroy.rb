# frozen_string_literal: true

module Web
  module Controllers
    module Books
      class Destroy
        include Web::Action

        def call(params)
          BookRepository.new.delete(params[:id])

          redirect_to routes.books_path
        end
      end
    end
  end
end
