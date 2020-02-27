require 'rails_helper'

module Bulma
  module Alignment
    class DummyClass
      include Bulma::Alignment
    end
  end
end

RSpec.describe Bulma::Alignment do
  it 'all alignments can be empty' do
    dc = Bulma::Alignment::DummyClass.new
    expect(dc.css_class).to eq('')
  end

  it 'alignment must be valid' do
    dc = Bulma::Alignment::DummyClass.new
    dc.alignment = :justified
    expect(dc.css_class).to eq('is-justified')
  end

  it 'alignment raise error if invalid' do
    dc = Bulma::Alignment::DummyClass.new
    expect {dc.alignment = :foo}.to raise_error(ArgumentError, 'Alignment foo not valid')
  end

  it 'text alignment must be valid' do
    dc = Bulma::Alignment::DummyClass.new
    dc.text_alignment = :justified
    expect(dc.css_class).to eq('has-text-justified')
  end

  it 'text alignment raise error if invalid' do
    dc = Bulma::Alignment::DummyClass.new
    expect {dc.text_alignment = :foo}.to raise_error(ArgumentError, 'Text alignment foo not valid')
  end
end