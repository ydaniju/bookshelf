# frozen_string_literal: true

RSpec.describe Web::Views::Books::Index, type: :view do
  let(:exposures) do
    Hash[format: :html, books: [], flash: {}, params: {}, session: {}]
  end
  let(:template) do
    Hanami::View::Template.new('apps/web/templates/books/index.html.erb')
  end
  let(:view) { described_class.new(template, exposures) }
  let(:rendered) { view.render }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end

  it 'exposes #books' do
    expect(view.books).to eq exposures.fetch(:books)
  end

  context 'when there are no books' do
    it 'renders placeholder message' do
      placeholder = '<p>There are no books yet.</p>'
      expect(rendered).to include(placeholder)
    end
  end

  context 'when there are books' do
    let(:book_repo) { BookRepository.new }
    let(:user_repo) { UserRepository.new }
    let(:user) { user_repo.create(email: 'ea@ea.ea', password: 'password') }
    let(:book1) do
      book_repo.create(
        title: 'Refactoring', author: 'Martin Fowler', user_id: user.id
      )
    end
    let(:book2) do
      book_repo.create(title: 'D D D', author: 'Eric Evans', user_id: user.id)
    end
    let(:exposures) do
      {
        books: [book1, book2], format: :html, params: {},
        flash: {}, session: {}, current_user: user
      }
    end

    it 'lists them all' do
      expect(rendered.scan(/class="book-wrapper"/).length).to eq(2)
      expect(rendered).to include('Refactoring')
      expect(rendered).to include('D D D')
    end

    it 'hides the placeholder message' do
      expect(rendered).to_not include(
        '<p class="placeholder">There are no books yet.</p>'
      )
    end
  end
end
