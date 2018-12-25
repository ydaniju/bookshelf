# frozen_string_literal: true

RSpec.describe Web::Views::Books::New, type: :view do
  let(:params) do
    OpenStruct.new(
      valid?: false, error_messages: [
        'Title must be filled', 'Author must be filled'
      ]
    )
  end
  let(:exposures) { Hash[format: :html, params: params, flash: {}] }
  let(:template) do
    Hanami::View::Template.new('apps/web/templates/books/new.html.erb')
  end
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    expect(rendered).to include('There was a problem with your submission')
    expect(rendered).to include('Title must be filled')
    expect(rendered).to include('Author must be filled')
  end
end
