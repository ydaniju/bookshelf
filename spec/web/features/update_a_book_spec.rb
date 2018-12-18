# frozen_string_literal: true

require 'features_helper'

RSpec.describe 'Update a book' do
  let(:repository) { BookRepository.new }

  before do
    repository.clear
  end

  it 'updates a book' do
    book = repository.create(title: 'Game of Thrones', author: 'GR Martin')
    visit "/books/#{book.id}"
    click_link 'Edit'
    fill_in 'Author', with: 'JRR Martin'
    expect(current_path).to eq("/books/#{book.id}/edit")
    # click_button 'Save'

    # expect(current_path).to eq("/books/#{book.id}")

    # expect(page).to have_content('JRR Martin')
  end
end
