# frozen_string_literal: true

module Web
  module Views
    module Books
      class Create
        include Web::View
        template 'books/new'

        def submit_message
          'Create Book'
        end
      end
    end
  end
end
