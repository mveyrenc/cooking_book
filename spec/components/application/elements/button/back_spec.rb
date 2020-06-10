require 'rails_helper'

RSpec.describe Application::Elements::Button::Back do
  it "renders the back button" do
    result = render_inline(Application::Elements::Button::Back.new(url: "#"))

    assert result.css(".button").any?
    assert result.css("span.icon").any?
    assert result.css("span.icon i.fa-list-alt").any?
    assert result.css('span:not(.icon)').any?
    assert result.css('span:not(.icon)').inner_html != ""
  end

  it "renders the back button without name" do
    result = render_inline(Application::Elements::Button::Back.new(url: "#", name: false))

    assert result.css("a.button").any?
    assert result.css("span.icon").any?
    assert !result.css('span:not(.icon)').any?
  end

  it "renders the back button with a custom name" do
    result = render_inline(Application::Elements::Button::Back.new(url: "#", name: "Custom name"))

    assert result.css("a.button").any?
    assert result.css("span.icon").any?
    assert result.css('span:not(.icon)').inner_html == "Custom name"
  end

  it "renders the back button without icon" do
    result = render_inline(Application::Elements::Button::Back.new(url: "#", icon: false))

    assert result.css("a.button").any?
    assert !result.css("span.icon").any?
    assert result.css('span:not(.icon)').any?
  end

  it "renders the back button with a custom icon" do
    result = render_inline(Application::Elements::Button::Back.new(url: "#", icon: 'test'))

    assert result.css("a.button").any?
    assert result.css("span.icon").any?
    assert !result.css("span.icon i.fa-list-alt").any?
    assert result.css("span.icon i.fa-test").any?
  end
end