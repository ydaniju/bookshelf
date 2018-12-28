# frozen_string_literal: true

RSpec.describe Web::Controllers::Books::Destroy, type: :action do
  let(:action) { described_class.new }
  let(:book_repo) { BookRepository.new }
  let(:user_repo) { UserRepository.new }
  let(:user) { user_repo.create(email: 'em@em.em', password: 'password') }

  before do
    book_repo.clear
    user_repo.clear

    @book = book_repo.create(
      title: '1984', author: 'George Orwell', user_id: user.id
    )
  end

  context 'when successful' do
    let(:params) { Hash[id: @book.id] }

    it 'deletes a book' do
      action.call(params)
      result = book_repo.last

      expect(result).to be_nil
    end

    it 'redirects to books path' do
      response = action.call(params)

      expect(response[1]['Location']).to eq('/books')
    end
  end
end
