# frozen_string_literal: true

RSpec.describe Web::Controllers::Books::New, type: :action do
  let(:action) { described_class.new }
  let(:user_repo) { UserRepository.new }
  let(:user) { user_repo.create(email: 'ea@ea.ea', password: 'password') }
  let(:params) do
    Hash[current_user: user, 'rack.session' => { user_id: user.id }]
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
