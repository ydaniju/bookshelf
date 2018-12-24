# frozen_string_literal: true

RSpec.describe Web::Views::Books::Index, type: :view do
  let(:exposures) { Hash[format: :html, books: []] }
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
    let(:repo) { BookRepository.new }
    let(:book1) { repo.create(title: 'Refactoring', author: 'Martin Fowler') }
    let(:book2) { repo.create(title: 'D D D', author: 'Eric Evans') }
    let(:exposures) { Hash[books: [book1, book2], format: :html, params: {}] }

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
