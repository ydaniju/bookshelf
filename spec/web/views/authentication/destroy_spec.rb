# frozen_string_literal: true

RSpec.describe Web::Views::Authentication::Destroy, type: :view do
  let(:exposures) { Hash[format: :html] }
  let(:template) do
    Hanami::View::Template.new(
      'apps/web/templates/authentication/destroy.html.erb'
    )
  end
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end
end
