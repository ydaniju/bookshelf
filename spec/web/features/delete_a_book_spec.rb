# frozen_string_literal: true

require 'features_helper'

RSpec.describe 'Delete a book' do
  before do
    repository = BookRepository.new
    repository.create(title: 'Akane No Mai', author: 'Nolan')

    @book = repository.last
  end

  it 'deletes a book' do
    visit "/books/#{@book.id}"
    within "#tools-#{@book.id}" do
      click_button 'Delete'
    end

    expect(page).not_to have_content('Akane No Mai')
  end
end
