# frozen_string_literal: true

module Web
  module Controllers
    module Books
      class Index
        include Web::Action
        include Web::Controllers::AuthenticationHelpers

        before :authenticate!
        expose :books

        def call(_params)
          @books = BookRepository.new.all
        end
      end
    end
  end
end
