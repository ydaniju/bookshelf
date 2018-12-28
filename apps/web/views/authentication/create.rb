# frozen_string_literal: true

module Web
  module Views
    module Authentication
      class Create
        include Web::View

        template 'authentication/new'
      end
    end
  end
end
