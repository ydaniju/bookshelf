# frozen_string_literal: true

require 'features_helper'

RSpec.describe 'List books' do
  let(:book_repo) { BookRepository.new }
  let(:user_repo) { UserRepository.new }
  let(:user) { user_repo.create(email: 'ydaniju@goa.fr', password: 'password') }

  before do
    page.set_rack_session(user_id: user.id)
    book_repo.create(title: 'PoEAA', author: 'Martin Fowler', user_id: user.id)
    book_repo.create(title: 'TDD',   author: 'Kent Beck', user_id: user.id)
  end

  it 'displays each book on the page' do
    visit '/books'

    within '#books' do
      expect(page).to have_selector('.book', count: 2),
                      'Expected to find 2 books'
    end
  end
end
