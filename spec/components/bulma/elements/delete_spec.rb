require 'rails_helper'

RSpec.describe Bulma::Elements::Delete do
  it "renders the delete button" do
    result = render_inline(Bulma::Elements::Delete)

    assert result.css(".delete").any?
    assert !result.css(".is-small").any?
    assert !result.css(".is-medium").any?
    assert !result.css(".is-large").any?
  end

  it "renders the small delete button" do
    result = render_inline(Bulma::Elements::Delete, styles: {size: :small})

    assert result.css(".delete").any?
    assert result.css(".is-small").any?
    assert !result.css(".is-medium").any?
    assert !result.css(".is-large").any?
  end

  it "renders the small delete button" do
    result = render_inline(Bulma::Elements::Delete, styles: {size: :medium})

    assert result.css(".delete").any?
    assert !result.css(".is-small").any?
    assert result.css(".is-medium").any?
    assert !result.css(".is-large").any?
  end

  it "renders the small delete button" do
    result = render_inline(Bulma::Elements::Delete, styles: {size: :large})

    assert result.css(".delete").any?
    assert !result.css(".is-small").any?
    assert !result.css(".is-medium").any?
    assert result.css(".is-large").any?
  end
end