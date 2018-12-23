# frozen_string_literal: true

module Web
  module Views
    module Registrations
      class Create
        include Web::View
        template 'registrations/new'

        def submit_message
          'Register'
        end
      end
    end
  end
end
