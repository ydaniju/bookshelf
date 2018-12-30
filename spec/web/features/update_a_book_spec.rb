# frozen_string_literal: true

require 'features_helper'

RSpec.describe 'Update a book' do
  let(:book_repo) { BookRepository.new }
  let(:user_repo) { UserRepository.new }
  let(:user) { user_repo.create(email: 'ea@ea.ea', password: 'password') }

  before do
    page.set_rack_session(user_id: user.id)
  end

  it 'updates a book' do
    book = book_repo.create(
      title: 'Game of Thrones',
      author: 'GR Martin',
      description: 'bbfb',
      user_id: user.id
    )
    visit "/books/#{book.id}"
    find('.book-wrapper').click
    fill_in 'Author', with: 'JRR Martin'
    click_button 'Save'

    expect(current_path).to eq("/books/#{book.id}")
    expect(page).to have_content('JRR Martin')
  end
end
