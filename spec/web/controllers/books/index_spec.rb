# frozen_string_literal: true

RSpec.describe Web::Controllers::Books::Index, type: :action do
  let(:action) { described_class.new }
  let(:book_repo) { BookRepository.new }
  let(:user_repo) { UserRepository.new }
  let(:user) { user_repo.create(email: 'emai@am.am', password: 'password') }
  let(:params) { Hash['rack.session' => { user_id: user.id }] }

  before do
    book_repo.clear
    user_repo.clear

    @book = book_repo.create(title: 'TDD', author: 'Kent Beck',
                             user_id: user.id)
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
