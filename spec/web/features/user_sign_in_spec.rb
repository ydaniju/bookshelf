# frozen_string_literal: true

require 'features_helper'

RSpec.describe 'User signs in' do
  let(:repository) { UserRepository.new }
  before do
    repository.clear

    repository.create(email: 'user@email.com', password: 'password')
  end
  it 'logs a user in' do
    visit '/authentication/new'
    fill_in 'Email', with: 'nuser@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content('All Books')
  end
end
