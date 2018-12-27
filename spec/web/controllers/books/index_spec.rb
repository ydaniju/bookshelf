# frozen_string_literal: true

RSpec.describe Web::Controllers::Books::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash['rack.session' => { user_id: 1 }] }
  let(:repository) { BookRepository.new }

  before do
    repository.clear

    @book = repository.create(title: 'TDD', author: 'Kent Beck', user_id: 1)
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes all books' do
    action.call(params)
    expect(action.exposures[:books]).to eq([@book])
  end
end
