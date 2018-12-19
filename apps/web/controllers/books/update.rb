module Web
  module Controllers
    module Books
      class Update
        include Web::Action

        expose :book

        def call(params)
          repository = BookRepository.new
          @book = repository.find(params.dig(:book, :id))
          repository.update(@book.id, params[:book])

          redirect_to routes.book_path(id: @book.id)
        end
      end
    end
  end
end
