require 'rails_helper'

module Application
  module Size
    class DummyClass
      include Application::Size
    end
  end
end

RSpec.describe Application::Size do
  it 'can be empty' do
    dc = Application::Size::DummyClass.new
    expect(dc.css_class).to eq('')
  end

  it 'must be a valid' do
    dc = Application::Size::DummyClass.new
    dc.size = :medium
    expect(dc.css_class).to eq('is-medium')
  end

  it 'raise error if invalid' do
    dc = Application::Size::DummyClass.new
    expect {dc.size = :foo}.to raise_error(ArgumentError, 'Size foo not valid')
  end
end