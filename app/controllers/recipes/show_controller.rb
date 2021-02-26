module Recipes
  class ShowController < SecuredController

    include InstanceConcern

    def call
      authorize! :read, instance
      breadcrumb instance.book.name, recipes_path(instance.book)
      breadcrumb instance.name, recipe_path(instance)

      part = params[:part] || Recipes::Parts::DetailComponent::PART_RECIPE

      render Recipes::Show::ViewComponent.new(object: decorate(instance), part: part)
    end
  end
end
