# frozen_string_literal: true

module Web
  module Controllers
    module Books
      class Index
        include Web::Action
        before :authenticate!
        expose :books

        def call(_params)
          @books = BookRepository.new.all
        end

        private

        def authenticate!
          return if signed_in?

          flash[:error] = 'Please sign in first'
          redirect_to routes.new_registration_path
        end

        def signed_in?
          !session[:user_id].nil?
        end
      end
    end
  end
end
