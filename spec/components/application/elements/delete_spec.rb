require 'rails_helper'

RSpec.describe Application::Elements::Delete do
  it "renders the delete button" do
    result = render_inline(Application::Elements::Delete.new())

    assert result.css(".delete").any?
    assert !result.css(".is-small").any?
    assert !result.css(".is-medium").any?
    assert !result.css(".is-large").any?
  end

  it "renders the small delete button" do
    result = render_inline(Application::Elements::Delete.new(styles: {size: :small}))

    assert result.css(".delete").any?
    assert result.css(".is-small").any?
    assert !result.css(".is-medium").any?
    assert !result.css(".is-large").any?
  end

  it "renders the small delete button" do
    result = render_inline(Application::Elements::Delete.new(styles: {size: :medium}))

    assert result.css(".delete").any?
    assert !result.css(".is-small").any?
    assert result.css(".is-medium").any?
    assert !result.css(".is-large").any?
  end

  it "renders the small delete button" do
    result = render_inline(Application::Elements::Delete.new(styles: {size: :large}))

    assert result.css(".delete").any?
    assert !result.css(".is-small").any?
    assert !result.css(".is-medium").any?
    assert result.css(".is-large").any?
  end
end