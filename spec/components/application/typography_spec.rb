require 'rails_helper'

module Application
  module Typography
    class DummyClass
      include Application::Typography
    end
  end
end

RSpec.describe Application::Typography do
  it 'all typographies can be empty' do
    dc = Application::Typography::DummyClass.new
    expect(dc.css_class).to eq('')
  end

  it 'font size must be valid' do
    dc = Application::Typography::DummyClass.new
    dc.font_size = :size1
    expect(dc.css_class).to eq('is-size-1')
  end

  it 'font size raise error if invalid' do
    dc = Application::Typography::DummyClass.new
    expect {dc.font_size = :foo}.to raise_error(ArgumentError, 'Font size foo not valid')
  end

  it 'text weight must be valid' do
    dc = Application::Typography::DummyClass.new
    dc.text_weight = :bold
    expect(dc.css_class).to eq('has-text-weight-bold')
  end

  it 'text weight raise error if invalid' do
    dc = Application::Typography::DummyClass.new
    expect {dc.text_weight = :foo}.to raise_error(ArgumentError, 'Text weight foo not valid')
  end

  it 'font family must be valid' do
    dc = Application::Typography::DummyClass.new
    dc.font_family = :code
    expect(dc.css_class).to eq('is-family-code')
  end

  it 'font family raise error if invalid' do
    dc = Application::Typography::DummyClass.new
    expect {dc.font_family = :foo}.to raise_error(ArgumentError, 'Font family foo not valid')
  end
end