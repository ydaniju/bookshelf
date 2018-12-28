# frozen_string_literal: true

require 'features_helper'

RSpec.describe 'User logs out' do
  let(:user) do
    UserRepository.new.create(email: 'ydaniju@goa.fr', password: 'password')
  end

  before { page.set_rack_session(user_id: user.id) }

  after do
    BookRepository.new.clear
  end

  it 'logs user out' do
    visit '/books'

    within '.dropdown' do
      click_button 'AV'
      click_button 'Logout'
    end

    expect(page).to have_current_path('/')
    expect(page).to have_content(/logged out/)
  end
end
