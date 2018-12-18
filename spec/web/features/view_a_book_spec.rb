# frozen_string_literal: true

require 'features_helper'

RSpec.describe 'View a books' do
  let(:repository) { BookRepository.new }
  before do
    repository.clear

    repository.create(title: 'PoEAA', author: 'Martin Fowler')
  end
  let(:book) { repository.first }

  it 'displays each book on the page' do
    visit "/books/#{book.id}"

    within "#book#{book.id}" do
      expect(page).to have_content('PoEAA')
    end
  end
end
