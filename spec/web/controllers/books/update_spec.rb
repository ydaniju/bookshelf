# frozen_string_literal: true

RSpec.describe Web::Controllers::Books::Update, type: :action do
  let(:action) { described_class.new }
  let(:book_repo) { BookRepository.new }
  let(:user_repo) { UserRepository.new }

  before do
    book_repo.clear
    user_repo.clear
    user = user_repo.create(email: 'ea@ea.ea', password: 'password')
    @book = book_repo.create(
      title: 'Confident Ruby', author: 'Avdi Grimm', user_id: user.id
    )
  end

  context 'with valid params' do
    let(:params) { Hash[id: @book.id, book: { **@book, author: 'Logan' }] }

    it 'update author of book' do
      action.call(params)
      result = book_repo.last

      expect(result.author).to eq(params.dig(:book, :author))
    end

    it 'redirects the user to the books listing' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq("/books/#{@book.id}")
    end
  end
end
