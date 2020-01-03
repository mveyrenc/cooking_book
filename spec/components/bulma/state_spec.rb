require 'rails_helper'

module Bulma
  module State
    class DummyClass
      include Bulma::State
    end
  end
end

RSpec.describe Bulma::State do
  it 'all states can be empty' do
    dc = Bulma::State::DummyClass.new
    expect(dc.css_class).to eq('')
  end

  it 'outlined' do
    dc = Bulma::State::DummyClass.new
    dc.outlined = true
    expect(dc.css_class).to eq('is-outlined')
  end

  it 'not outlined after outlined' do
    dc = Bulma::State::DummyClass.new
    dc.outlined = true
    dc.outlined = false
    expect(dc.css_class).to_not contain_exactly('is-outlined')
  end

  it 'loading' do
    dc = Bulma::State::DummyClass.new
    dc.loading = true
    expect(dc.css_class).to eq('is-loading')
  end

  it 'not loading after loading' do
    dc = Bulma::State::DummyClass.new
    dc.loading = true
    dc.loading = false
    expect(dc.css_class).to_not contain_exactly('is-loading')
  end

  it 'disabled' do
    dc = Bulma::State::DummyClass.new
    dc.disabled = true
    expect(dc.css_class).to eq('')
  end

  it 'not disabled after disabled' do
    dc = Bulma::State::DummyClass.new
    dc.disabled = true
    dc.disabled = false
    expect(dc.css_class).to eq('')
  end
end