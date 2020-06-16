require 'rails_helper'

module Application
  module State
    class DummyClass
      include Application::State
    end
  end
end

RSpec.describe Application::State do
  it 'all states can be empty' do
    dc = Application::State::DummyClass.new
    expect(dc.css_class).to eq('')
  end

  it 'outlined' do
    dc = Application::State::DummyClass.new
    dc.outlined = true
    expect(dc.css_class).to eq('is-outlined')
  end

  it 'not outlined after outlined' do
    dc = Application::State::DummyClass.new
    dc.outlined = true
    dc.outlined = false
    expect(dc.css_class).to_not contain_exactly('is-outlined')
  end

  it 'loading' do
    dc = Application::State::DummyClass.new
    dc.loading = true
    expect(dc.css_class).to eq('is-loading')
  end

  it 'not loading after loading' do
    dc = Application::State::DummyClass.new
    dc.loading = true
    dc.loading = false
    expect(dc.css_class).to_not contain_exactly('is-loading')
  end
end