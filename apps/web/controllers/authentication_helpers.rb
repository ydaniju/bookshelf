# frozen_string_literal: true

module Web
  module Controllers
    module AuthenticationHelpers
      private

      def authenticate!
        return if signed_in?

        flash[:error] = 'Please sign in first'
        redirect_to routes.new_registration_path
      end

      def signed_in?
        !session[:user_id].nil? && !current_user.nil?
      end

      def current_user
        @current_user ||= UserRepository.new.find(session[:user_id])
      end
    end
  end
end
