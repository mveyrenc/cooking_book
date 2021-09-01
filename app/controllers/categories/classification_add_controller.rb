module Categories
  class ClassificationAddController < SecuredController

    include FriendlyInstanceConcern

    def call
      authorize! :update, instance
      breadcrumb instance.name, category_path(instance)

      related = model_class.find_or_create_by(
        categorization_id: permit_params[:categorization_id],
        name: permit_params[:category_name]
      ) do |c|
        c.author = current_user
        c.modifier = current_user
      end

      respond_to do |format|
        flash.now[:notice] = t('.success')
        if related and instance.send(permit_params[:relation_type]) << related
          format.turbo_stream {
            s = turbo_stream.replace "#{helpers.dom_id(instance)}_classification" do
              view_context.render(Categories::Classification::ManageComponent.new(object: decorate(instance)))
            end
            render turbo_stream: s
          }
          format.html { redirect_to instance }
        else
          format.html { render Categories::Edit::ViewComponent.new(object: decorate(instance)) }
        end
      end
    end

    private

    def permit_params
      params
        .require(:category)
        .permit(
          :categorization_id,
          :category_name,
          :relation_type
        )
    end
  end
end
