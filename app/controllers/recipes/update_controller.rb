module Recipes
  class UpdateController < SecuredController

    include InstanceConcern

    def call
      authorize! :update, instance
      breadcrumb instance.name, recipe_path(instance)

      instance.modifier = current_user

      part = params[:part] || Recipes::Parts::DetailComponent::PART_RECIPE

      respond_to do |format|
        if instance.update(permit_params)
          format.turbo_stream {
            s = turbo_stream.replace dom_id(instance) do
              view_context.render(Recipes::Show::FormComponent.new(object: decorate(instance), part: part, with_turbo: true))
            end
            render turbo_stream: s
          }
          format.html { redirect_to instance, notice: t('.success') }
        else
          format.html { render Recipes::Edit::ViewComponent.new(object: decorate(instance), part: part) }
        end
      end
    end

    private

    def permit_params
      params.require(:recipe).permit(
        :name,
        { :category_ids => [] },
        :description,
        :picture,
        :times,
        :quantity,
        :ingredients,
        :directions,
        :wine,
        :difficulty,
        :cost
      )
    end
  end
end
