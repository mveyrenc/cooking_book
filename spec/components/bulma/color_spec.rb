require 'rails_helper'

module Bulma
  module Color
    class DummyClass
      include Bulma::Color
    end
  end
end

RSpec.describe Bulma::Color do
  it 'all colors can be empty' do
    dc = Bulma::Color::DummyClass.new
    expect(dc.css_class).to eq('')
  end

  it 'main color must be valid' do
    dc = Bulma::Color::DummyClass.new
    dc.main_color = :orange
    expect(dc.css_class).to eq('is-orange')
  end

  it 'main color raise error if invalid' do
    dc = Bulma::Color::DummyClass.new
    expect {dc.main_color = :foo}.to raise_error(ArgumentError, 'Color foo not valid')
  end

  it 'background color must be valid' do
    dc = Bulma::Color::DummyClass.new
    dc.background_color = :orange
    expect(dc.css_class).to eq('has-background-orange')
  end

  it 'background color raise error if invalid' do
    dc = Bulma::Color::DummyClass.new
    expect {dc.background_color = :foo}.to raise_error(ArgumentError, 'Background color foo not valid')
  end

  it 'text color must be valid' do
    dc = Bulma::Color::DummyClass.new
    dc.text_color = :orange
    expect(dc.css_class).to eq('has-text-orange')
  end

  it 'text color raise error if invalid' do
    dc = Bulma::Color::DummyClass.new
    expect {dc.text_color = :foo}.to raise_error(ArgumentError, 'Text color foo not valid')
  end
end