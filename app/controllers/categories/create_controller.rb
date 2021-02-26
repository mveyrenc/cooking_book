module Categories
  class CreateController < SecuredController

    include ModelConcern

    def call
      authorize! :create, model_class
      instance = new_instance_from_params
      instance.author = current_user
      instance.modifier = current_user

      if instance.save
        redirect_to instance, flash: { notice: t('.success') }
      else
        render Categories::New::ViewComponent.new(object: decorate(instance))
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
