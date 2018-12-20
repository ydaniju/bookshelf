module Web
  module Controllers
    module Books
      class Update
        include Web::Action

        expose :book

        def call(params)
          # binding.pry
          repository = BookRepository.new
          # @book = repository.find(params.dig(:book, :id))
          repository.update(params.dig(:book, :id), params[:book])

          redirect_to routes.book_path(id: params.dig(:book, :id))
        end
      end
    end
  end
end
