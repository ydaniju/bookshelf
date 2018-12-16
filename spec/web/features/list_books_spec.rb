require 'features_helper'

RSpec.describe 'List books' do
  it 'displays each book on the page' do
    visit '/books'

    expect(page).to have_css('.book', count: 2)
  end
end
