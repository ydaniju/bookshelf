# frozen_string_literal: true

RSpec.describe Web::Controllers::Books::Destroy, type: :action do
  let(:action) { described_class.new }
  let(:repository) { BookRepository.new }

  before do
    repository.clear
    @book = repository.create(title: '1984', author: 'George Orwell')
  end

  it 'deletes a book' do
    params = Hash[id: @book.id]
    action.call(params)
    result = repository.last

    expect(result).to be_nil
  end
end
