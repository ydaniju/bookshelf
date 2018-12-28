# frozen_string_literal: true

RSpec.describe Web::Controllers::Books::Create, type: :action do
  let(:action) { described_class.new }
  let(:user_repo) { UserRepository.new }
  let(:repository) { BookRepository.new }
  let(:user) { user_repo.create(email: 'em@em.em', password: 'password') }

  before do
    repository.clear
    user_repo.clear
  end

  context 'with valid params' do
    let(:params) do
      { book: {
        title: 'Confident Ruby', author: 'Avdi Grimm', user_id: user.id
      } }
    end

    it 'creates a new book' do
      action.call(params)
      book = repository.last

      expect(book.id).to_not be_nil
      expect(book.title).to eq(params.dig(:book, :title))
    end

    it 'redirects the user to the books listing' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/books')
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[book: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eq(422)
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:book, :title)).to eq(['is missing'])
      expect(errors.dig(:book, :author)).to eq(['is missing'])
    end
  end
end
