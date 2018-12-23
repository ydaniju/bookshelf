# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Web::Views::ApplicationLayout, type: :view do
  let(:header_partial) do
    Hanami::View::Template.new('apps/web/templates/shared/_header.html.erb')
  end
  let(:partial) { Web::Views::Shared::Header.new(header_partial) }
  let(:exposures) { partial.render }
  let(:layout) do
    Web::Views::ApplicationLayout.new(partial, exposures)
  end
  let(:rendered) { layout.render }

  it 'contains application name' do
    expect(rendered).to include('Bookshelf')
  end
end
