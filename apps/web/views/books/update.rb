# frozen_string_literal: true

module Web
  module Views
    module Books
      class Update
        include Web::View
        template 'books/edit'

        def submit_message
          'Save'
        end
      end
    end
  end
end
