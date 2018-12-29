# frozen_string_literal: true

module Web
  module Controllers
    module Home
      class Index
        include Web::Action

        def call(params); end

        private

        def authenticate!; end
      end
    end
  end
end
