# frozen_string_literal: true

module Web
  module Views
    module Books
      class New
        include Web::View

        def submit_message
          'Create Book'
        end
      end
    end
  end
end
