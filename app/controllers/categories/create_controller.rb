module Categories
  class CreateController < SecuredController

    include ModelConcern

    def call
      authorize! :create, model_class
      instance = new_instance_from_params
      instance.author = current_user
      instance.modifier = current_user

      respond_to do |format|
        if instance.save
          flash.now[:notice] = t('.success')
          format.turbo_stream { redirect_to instance, status: :see_other }
          format.html { redirect_to instance, status: :see_other }
        else
          format.turbo_stream {
            s = turbo_stream.replace helpers.dom_id(instance) do
              view_context.render(Categories::New::ViewComponent.new(object: decorate(instance)))
            end
            render turbo_stream: s, status: :unprocessable_entity
          }
          format.html { render Categories::New::ViewComponent.new(object: decorate(instance)), status: :unprocessable_entity }
        end
      end
    end

    private

    def permit_params
      params.require(:category).permit(
        :name,
        :categorization_id
      )
    end
  end
end
