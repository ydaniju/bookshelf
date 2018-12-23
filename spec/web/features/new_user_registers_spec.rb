# frozen_string_literal: true

require 'features_helper'

RSpec.describe 'New user registers' do
  it 'creates a new user' do
    visit '/registrations/new'
    fill_in 'Email', with: 'new@registrar.com'
    fill_in 'Password', with: 'password'
    click_button 'Register'

    expect(page).to have_content('Dashboard')
  end
end
