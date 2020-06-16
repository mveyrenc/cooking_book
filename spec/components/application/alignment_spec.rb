require 'rails_helper'

module Application
  module Alignment
    class DummyClass
      include Application::Alignment
    end
  end
end

RSpec.describe Application::Alignment do
  it 'all alignments can be empty' do
    dc = Application::Alignment::DummyClass.new
    expect(dc.css_class).to eq('')
  end

  it 'alignment must be valid' do
    dc = Application::Alignment::DummyClass.new
    dc.alignment = :justified
    expect(dc.css_class).to eq('is-justified')
  end

  it 'alignment raise error if invalid' do
    dc = Application::Alignment::DummyClass.new
    expect {dc.alignment = :foo}.to raise_error(ArgumentError, 'Alignment foo not valid')
  end

  it 'text alignment must be valid' do
    dc = Application::Alignment::DummyClass.new
    dc.text_alignment = :justified
    expect(dc.css_class).to eq('has-text-justified')
  end

  it 'text alignment raise error if invalid' do
    dc = Application::Alignment::DummyClass.new
    expect {dc.text_alignment = :foo}.to raise_error(ArgumentError, 'Text alignment foo not valid')
  end
end