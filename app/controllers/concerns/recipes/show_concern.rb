module Recipes::ShowConcern
  extend ActiveSupport::Concern

  included do
    def do_show
      render show_component
    end

    private

    def show_component
      Recipes::Views::ShowComponent.new(object: @recipe, part: @part)
    end

  end
end