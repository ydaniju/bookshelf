# frozen_string_literal: true

module Web
  module Controllers
    module Authentication
      class Create
        include Web::Action

        params do
          required(:user).schema do
            required(:email).filled(:str?, format?: /@/)
            required(:password).filled(:str?, size?: (8..50))
          end
        end

        def call(params)
          user = UserRepository.new.find_by(params[:user])

          if user.nil?
            self.status = 422
          else
            session[:user_id] = user.id
            redirect_to routes.books_path
          end
        end
      end
    end
  end
end
