# frozen_string_literal: true

module Web
  module Controllers
    module Authentication
      class Destroy
        include Web::Action

        def call(_params)
          session[:user_id] = nil

          flash[:success] = 'You have been logged out'
          redirect_to routes.root_path
        end
      end
    end
  end
end
