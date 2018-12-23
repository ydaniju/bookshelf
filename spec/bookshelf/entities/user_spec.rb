RSpec.describe User, type: :entity do
  it 'can be instantitated with attributes' do
    user = User.new(email: 'danijuyusuf@gmail.com', password: 'password')

    expect(user.email).to eql('danijuyusuf@gmail.com')
    expect(user.password).to eql('password')
  end
end
