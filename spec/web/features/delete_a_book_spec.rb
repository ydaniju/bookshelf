require 'features_helper'

RSpec.describe 'Delete a book' do
  before do
    repository = BookRepository.new
    repository.create(title: 'Akane No Mai', author: 'Nolan')

    @book = repository.last
  end

  it 'deletes a book' do
    visit '/books'
    within "#book-#{@book.id}" do
      click_link 'Delete'
    end

    expect(page).not_to have_content('Akane No Mai')
  end
end
