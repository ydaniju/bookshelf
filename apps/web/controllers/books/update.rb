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

        expose :book

        def call(params)
          repository = BookRepository.new
          @book = repository.find(params[:id])
          if params.valid?
            repository.update(params[:id], params[:book])

            redirect_to routes.book_path(id: params[:id])
          else
            self.status = 422
          end
        end
      end
    end
  end
end
