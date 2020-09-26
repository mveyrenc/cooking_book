require 'rails_helper'

RSpec.describe Application::Components::BreadcrumbComponent do
  it "renders the breadcrumb" do
    result = render_inline(Application::Components::BreadcrumbComponent.new()) do
      '<ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
          </ul>'.html_safe
    end

    assert result.css(".breadcrumb").any?
  end

  it "renders the breadcrumb with a size" do
    result = render_inline(Application::Components::BreadcrumbComponent.new(styles: {size: :small})) do
      '<ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
          </ul>'.html_safe
    end

    assert result.css(".breadcrumb").any?
    assert result.css(".is-small").any?
    assert !result.css(".is-medium").any?
    assert !result.css(".is-large").any?
  end

  it "renders the breadcrumb with an alignment" do
    result = render_inline(Application::Components::BreadcrumbComponent.new(styles: {alignment: :centered})) do
      '<ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
          </ul>'.html_safe
    end

    assert result.css(".breadcrumb").any?
    assert result.css(".is-centered").any?
    assert !result.css(".is-justified").any?
    assert !result.css(".is-left").any?
    assert !result.css(".is-right").any?
  end

  it "renders the breadcrumb with a separator" do
    result = render_inline(Application::Components::BreadcrumbComponent.new(styles: {separator: :arrow})) do
      '<ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
          </ul>'.html_safe
    end

    assert result.css(".breadcrumb").any?
    assert result.css(".has-arrow-separator").any?
    assert !result.css(".has-bullet-separator").any?
    assert !result.css(".has-dot-separator").any?
    assert !result.css(".has-succeeds-separator").any?
  end
end