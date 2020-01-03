require 'rails_helper'

module Stylable
  class DummyClass
    include Stylable

    def default_styles
      ['this', 'is', 'a', 'style']
    end
  end
end

RSpec.describe Stylable do
  it 'can define a default style' do
    dc = Stylable::DummyClass.new
    expect(dc.css_class).to eq('this is a style')
  end

  it 'can add a style' do
    dc = Stylable::DummyClass.new
    dc.add_styles 'new-style'
    expect(dc.css_class).to eq('this is a style new-style')
  end

  it 'can remove a style' do
    dc = Stylable::DummyClass.new
    dc.remove_styles 'style'
    expect(dc.css_class).to eq('this is a')
  end

  it 'can add several styles' do
    dc = Stylable::DummyClass.new
    dc.add_styles 'style-1', 'style-2', 'style-1'
    expect(dc.css_class).to eq('this is a style style-1 style-2')
  end

  it 'can remove several styles' do
    dc = Stylable::DummyClass.new
    dc.remove_styles 'this', 'a'
    expect(dc.css_class).to eq('is style')
  end
end