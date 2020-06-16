module Application
  module Components
    class BreadcrumbPreview < ViewComponent::Preview
      def with_default_options
        render(Application::Components::Breadcrumb) do
          '<ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
          </ul>'.html_safe
        end
      end

      def with_alignment_centered
        render(Application::Components::Breadcrumb, styles: {alignment: :centered}) do
          '<ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
          </ul>'.html_safe
        end
      end

      def with_alignment_right
        render(Application::Components::Breadcrumb, styles: {alignment: :right}) do
          '<ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
          </ul>'.html_safe
        end
      end

      def with_arrow_separator
        render(Application::Components::Breadcrumb, styles: {separator: :arrow}) do
          '<ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
          </ul>'.html_safe
        end
      end

      def with_bullet_separator
        render(Application::Components::Breadcrumb, styles: {separator: :bullet}) do
          '<ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
          </ul>'.html_safe
        end
      end

      def with_dot_separator
        render(Application::Components::Breadcrumb, styles: {separator: :dot}) do
          '<ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
          </ul>'.html_safe
        end
      end

      def with_succeeds_separator
        render(Application::Components::Breadcrumb, styles: {separator: :succeeds}) do
          '<ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
          </ul>'.html_safe
        end
      end

      def with_small_size
        render(Application::Components::Breadcrumb, styles: {size: :small}) do
          '<ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
          </ul>'.html_safe
        end
      end

      def with_medium_size
        render(Application::Components::Breadcrumb, styles: {size: :medium}) do
          '<ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
          </ul>'.html_safe
        end
      end

      def with_large_size
        render(Application::Components::Breadcrumb, styles: {size: :large}) do
          '<ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
          </ul>'.html_safe
        end
      end
    end
  end
end