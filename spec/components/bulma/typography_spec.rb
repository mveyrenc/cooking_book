require 'rails_helper'

module Bulma
  module Typography
    class DummyClass
      include Bulma::Typography
    end
  end
end

RSpec.describe Bulma::Typography do
  it 'all typographies can be empty' do
    dc = Bulma::Typography::DummyClass.new
    expect(dc.css_class).to eq('')
  end

  it 'font size must be valid' do
    dc = Bulma::Typography::DummyClass.new
    dc.font_size = :size1
    expect(dc.css_class).to eq('is-size-1')
  end

  it 'font size raise error if invalid' do
    dc = Bulma::Typography::DummyClass.new
    expect {dc.font_size = :foo}.to raise_error(ArgumentError, 'Font size not valid')
  end

  it 'text alignment must be valid' do
    dc = Bulma::Typography::DummyClass.new
    dc.text_alignment = :justified
    expect(dc.css_class).to eq('has-text-justified')
  end

  it 'text alignment raise error if invalid' do
    dc = Bulma::Typography::DummyClass.new
    expect {dc.text_alignment = :foo}.to raise_error(ArgumentError, 'Text alignment not valid')
  end

  it 'text weight must be valid' do
    dc = Bulma::Typography::DummyClass.new
    dc.text_weight = :bold
    expect(dc.css_class).to eq('has-text-weight-bold')
  end

  it 'text weight raise error if invalid' do
    dc = Bulma::Typography::DummyClass.new
    expect {dc.text_weight = :foo}.to raise_error(ArgumentError, 'Text weight not valid')
  end

  it 'font family must be valid' do
    dc = Bulma::Typography::DummyClass.new
    dc.font_family = :code
    expect(dc.css_class).to eq('is-family-code')
  end

  it 'font family raise error if invalid' do
    dc = Bulma::Typography::DummyClass.new
    expect {dc.font_family = :foo}.to raise_error(ArgumentError, 'Font family not valid')
  end
end