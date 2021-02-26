module Categories
  class ClassificationAddController < SecuredController

    include InstanceConcern

    def call
      authorize! :update, instance
      breadcrumb instance.name, category_path(instance)

      instance.modifier = current_user
      related = model_class.friendly.find(permit_params[:related_id])
      if related
        instance["#{permit_params[:relation_type]}_ids"] << (related)
      end

      respond_to do |format|
        if instance.save
          format.turbo_stream {
            s = turbo_stream.replace helpers.dom_id(instance) do
              view_context.render(Categories::Classification::ShowComponent.new(object: decorate(instance)))
            end
            render turbo_stream: s
          }
          format.html { redirect_to instance, notice: t('.success') }
        else
          format.html { render Categories::Edit::ViewComponent.new(object: decorate(instance)) }
        end
      end
    end

    private

    def permit_params
      params
        .require(:category).permit(
        :related_id,
        :relation_type
      )
    end
  end
end
