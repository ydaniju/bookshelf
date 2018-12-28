# frozen_string_literal: true

module Web
  module Controllers
    module Authentication
      class Create
        include Web::Action

        def call(params)
          user = UserRepository.new.find_by(
            email: params[:authentication][:email],
            password: params[:authentication][:password]
          )

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
