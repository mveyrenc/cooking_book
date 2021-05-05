module Recipes
  class CreateController < SecuredController

    include ModelConcern

    def call
      authorize! :create, model_class
      instance = new_instance_from_params
      instance.author = current_user
      instance.modifier = current_user

      if instance.save
        flash.now[:notice] = t('.success')
        redirect_to edit_recipe_path instance
      else
        render Recipes::New::ViewComponent.new(object: decorate(instance), part: Recipes::Parts::DetailComponent::PART_RECIPE)
      end
    end

    private

    def permit_params
      params.require(:recipe).permit(
        :name,
        :book_id,
        :description,
        :wine,
      )
    end
  end
end
