RSpec.describe Book, type: :entity do
  it 'can be instantitated with attributes' do
    book = Book.new(title: "The Hanami Way")
    expect(book.title).to eql('The Hanami Way')
  end
end
