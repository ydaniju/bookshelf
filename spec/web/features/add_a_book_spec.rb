# frozen_string_literal: true

require 'features_helper'

RSpec.describe 'Add a book' do
  let(:user) do
    UserRepository.new.create(email: 'ydaniju@goa.fr', password: 'password')
  end

  before { page.set_rack_session(user_id: user.id) }

  after do
    BookRepository.new.clear
  end

  it 'can create a new book' do
    visit '/books/new'

    within 'form#book-form' do
      fill_in 'Title',  with: 'New Yorker'
      fill_in 'Author', with: 'Some author'
      fill_in 'Description', with: 'This book does not exist'

      click_button 'Create'
    end

    expect(page).to have_current_path('/books')
    expect(page).to have_content('New Yorker')
    expect(page).not_to have_content('There was a problem with your submission')
  end

  it 'displays list of errors when params contains errors' do
    visit '/books/new'

    within 'form#book-form' do
      click_button 'Create Book'
    end

    expect(current_path).to eq('/books')

    expect(page).to have_content('There was a problem with your submission')
    expect(page).to have_content('Title must be filled')
    expect(page).to have_content('Author must be filled')
  end
end
