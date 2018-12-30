# frozen_string_literal: true

require 'features_helper'

RSpec.describe 'Delete a book' do
  let(:book_repo) { BookRepository.new }
  let(:user_repo) { UserRepository.new }
  let(:user) { user_repo.create(email: 'ea@ea.ea', password: 'password') }

  before do
    page.set_rack_session(user_id: user.id)
    book_repo.create(title: 'Akane No Mai', author: 'Nolan', user_id: user.id)
    @book = book_repo.last
  end

  it 'deletes a book' do
    visit "/books/#{@book.id}"
    within "#tools-#{@book.id}" do
      click_button 'Delete'
    end

    expect(page).not_to have_content('Akane No Mai')
  end
end
