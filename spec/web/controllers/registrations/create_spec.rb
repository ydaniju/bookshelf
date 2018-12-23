# frozen_string_literal: true

RSpec.describe Web::Controllers::Registrations::Create, type: :action do
  let(:action) { described_class.new }

  context 'with valid params' do
    let(:params) { Hash[user: { email: 'ab@ab.ab', password: 'password' }] }

    it 'creates a user' do
      action.call(params)
      user = UserRepository.new.last

      expect(user.email).to eql('ab@ab.ab')
    end

    it 'is redirects to books path' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eql('/books')
    end
  end
end
