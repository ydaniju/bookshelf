# frozen_string_literal: true

RSpec.describe Web::Views::Registrations::New, type: :view do
  let(:params) do
    OpenStruct.new(
      valid?: false, error_messages: [
        'Email must be filled', 'Password must be filled'
      ]
    )
  end
  let(:exposures) { { format: :html, params: params, flash: {}, session: {} } }
  let(:template) do
    Hanami::View::Template.new('apps/web/templates/registrations/new.html.erb')
  end
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    expect(rendered).to include('There was a problem with your submission')
    expect(rendered).to include('Email must be filled')
    expect(rendered).to include('Password must be filled')
  end
end
