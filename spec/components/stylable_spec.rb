require 'rails_helper'

module Stylable
  class DummyClass
    include Stylable

    def default_styles
      ['default']
    end
  end
end

RSpec.describe Stylable do
  it 'can define a default style' do
    dc = Stylable::DummyClass.new
    expect(dc.css_class).to eq('default')
  end

  it 'can add a style' do
    dc = Stylable::DummyClass.new
    dc.add_styles 'new-style'
    expect(dc.css_class).to eq('default new-style')
  end

  it 'can add several styles' do
    dc = Stylable::DummyClass.new
    dc.add_styles 'style-1', 'style-2', 'style-1'
    expect(dc.css_class).to eq('default style-1 style-2')
  end
end