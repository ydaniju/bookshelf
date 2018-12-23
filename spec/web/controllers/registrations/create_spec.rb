# frozen_string_literal: true

RSpec.describe Web::Controllers::Registrations::Create, type: :action do
  let(:action) { described_class.new }

  context 'with valid params' do
    let(:params) { Hash[user: { email: 'ab@ab.ab', password: 'password' }] }
    let(:user) { UserRepository.new.last }

    it 'creates a user' do
      action.call(params)

      expect(user.email).to eql('ab@ab.ab')
    end

    it 'is redirects to books path' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eql('/books')
    end

    it 'sets session with user id' do
      action.call(params)
      session = params['rack.session']

      expect(session[:user_id]).to eq(user.id)
    end
  end
end
