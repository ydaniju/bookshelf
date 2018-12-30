# frozen_string_literal: true

require 'features_helper'

RSpec.describe 'View a books' do
  let(:book_repo) { BookRepository.new }
  let(:user_repo) { UserRepository.new }
  let(:user) { user_repo.create(email: 'ea@ea.ea', password: 'password') }
  let(:book) do
    book_repo.create(title: 'PoEAA', author: 'Martin Fowler', user_id: user.id)
  end

  before do
    page.set_rack_session(user_id: user.id)
  end

  it 'displays each book on the page' do
    visit "/books/#{book.id}"

    within "#book-#{book.id}" do
      expect(page).to have_content('PoEAA')
    end
  end
end
