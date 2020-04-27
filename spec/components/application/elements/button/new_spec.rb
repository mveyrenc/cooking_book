require 'rails_helper'

RSpec.describe Application::Elements::Button::New do
  it "renders the New button" do
    result = render_inline(Application::Elements::Button::New.new(url: "#"))

    assert result.css(".button").any?
    assert result.css("span.icon").any?
    assert result.css("span.icon i.fa-plus").any?
    assert result.css('span:not(.icon)').any?
  end

  it "renders the New button with a custom name" do
    result = render_inline(Application::Elements::Button::New.new(url: "#", name: "Custom name"))

    assert result.css("a.button").any?
    assert result.css("span.icon").any?
    assert result.css('span:not(.icon)').inner_html == "Custom name"
  end

  it "renders the New button without icon" do
    result = render_inline(Application::Elements::Button::New.new(url: "#", icon: false))

    assert result.css("a.button").any?
    assert !result.css("span.icon").any?
    assert result.css('span:not(.icon)').any?
  end

  it "renders the New button with a custom icon" do
    result = render_inline(Application::Elements::Button::New.new(url: "#", icon: 'test'))

    assert result.css("a.button").any?
    assert result.css("span.icon").any?
    assert !result.css("span.icon i.fa-plus").any?
    assert result.css("span.icon i.fa-test").any?
  end
end