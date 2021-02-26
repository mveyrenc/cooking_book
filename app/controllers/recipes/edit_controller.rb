module Recipes
  class EditController < SecuredController

    include InstanceConcern

    def call
      authorize! :update, instance
      breadcrumb instance.name, recipe_path(instance)

      part = params[:part] || Recipes::Parts::DetailComponent::PART_RECIPE

      render Recipes::Edit::ViewComponent.new(object: decorate(instance), part: part)
    end
  end
end
