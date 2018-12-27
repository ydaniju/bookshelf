# frozen_string_literal: true

RSpec.describe Web::Views::Books::Edit, type: :view do
  let(:params) do
    OpenStruct.new(
      valid?: false, error_messages: ['Title must be filled']
    )
  end
  let(:book) { BookRepository.new.create(title: 'Broomhilda', author: 'Otto') }
  let(:exposures) do
    {
      format: :html, params: params, book: book,
      flash: {}, session: { 'rack.session' => { user_id: 1 } }
    }
  end
  let(:template) do
    Hanami::View::Template.new('apps/web/templates/books/edit.html.erb')
  end
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays the value of fields already entered' do
    expect(rendered).to include('Otto')
  end

  it 'displays list of errors when params contains errors' do
    expect(rendered).to include('There was a problem with your submission')
    expect(rendered).to include('Title must be filled')
  end
end
