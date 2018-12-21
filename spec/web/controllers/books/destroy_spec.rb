# frozen_string_literal: true

RSpec.describe Web::Controllers::Books::Destroy, type: :action do
  let(:action) { described_class.new }
  let(:repository) { BookRepository.new }

  before do
    repository.clear
    @book = repository.create(title: '1984', author: 'George Orwell')
  end

  context 'when successful' do
    let(:params) { Hash[id: @book.id] }

    it 'deletes a book' do
      action.call(params)
      result = repository.last

      expect(result).to be_nil
    end

    it 'redirects to books path' do
      response = action.call(params)

      expect(response[1]['Location']).to eq('/books')
    end
  end
end
