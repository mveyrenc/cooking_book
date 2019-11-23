require 'rails_helper'

module Bulma
  module Size
    class DummyClass
      include Bulma::Size
    end
  end
end

RSpec.describe Bulma::Size do
  it 'can be empty' do
    dc = Bulma::Size::DummyClass.new
    expect(dc.css_class).to eq('')
  end

  it 'must be a valid' do
    dc = Bulma::Size::DummyClass.new
    dc.size = :medium
    expect(dc.css_class).to eq('is-medium')
  end

  it 'raise error if invalid' do
    dc = Bulma::Size::DummyClass.new
    expect {dc.size = :foo}.to raise_error(ArgumentError, 'Size not valid')
  end
end