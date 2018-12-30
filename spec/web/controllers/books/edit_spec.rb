# frozen_string_literal: true

RSpec.describe Web::Controllers::Books::Edit, type: :action do
  let(:action) { described_class.new }
  let(:user_repo) { UserRepository.new }
  let(:user) { user_repo.create(email: 'ea@ea.ea', password: 'passsword') }
  let(:params) { Hash['rack.session' => { user_id: user.id }] }

  before { user_repo.clear }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
