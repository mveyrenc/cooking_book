module Recipes
  class NewController < SecuredController

    include ModelConcern

    def call
      authorize! :create, model_class
      instance = new_instance

      render Recipes::New::ViewComponent.new(object: decorate(instance), part: Recipes::Parts::DetailComponent::PART_RECIPE)
    end
  end
end
