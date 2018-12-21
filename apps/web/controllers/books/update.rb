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
          if params.valid?
            update_and_redirect(params)
          else
            render_edit_with_errors(params)
          end
        end

        private

        def update_and_redirect(params)
          repository.update(params[:id], params[:book])

          redirect_to routes.book_path(id: params[:id])
        end

        def render_edit_with_errors(params)
          @book = repository.find(params[:id])

          self.status = 422
        end

        def repository
          @repository ||= BookRepository.new
        end
      end
    end
  end
end
