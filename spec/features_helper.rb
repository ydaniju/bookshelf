# frozen_string_literal: true

# Require this file for feature tests
require_relative './spec_helper'

require 'capybara'
require 'capybara/rspec'
require 'rack_session_access/capybara'

RSpec.configure do |config|
  config.after type: :feature do
    page.set_rack_session(user_id: nil, session_id: nil)
  end

  config.include RSpec::FeatureExampleGroup

  config.include Capybara::DSL,           feature: true
  config.include Capybara::RSpecMatchers, feature: true
end
