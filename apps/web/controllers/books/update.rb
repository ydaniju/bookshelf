# frozen_string_literal: true

module Web
  module Controllers
    module Books
      class Update
        include Web::Action

        params do
          required(:book).schema do
            required(:title).filled(:str?)
            required(:author).filled(:str?)
          end
        end

        def call(params)
          repository = BookRepository.new
          repository.update(params[:id], params[:book])

          redirect_to routes.book_path(id: params[:id])
        end
      end
    end
  end
end
