module Categories
  class UpdateController < SecuredController

    include FriendlyInstanceConcern

    def call
      authorize! :update, instance
      breadcrumb instance.name, category_path(instance)

      instance.modifier = current_user

      respond_to do |format|
        if instance.update(permit_params)
          flash.now[:notice] = t('.success')
          format.turbo_stream {
            s = turbo_stream.replace helpers.dom_id(instance) do
              view_context.render(Categories::Title::ShowComponent.new(object: decorate(instance)))
            end
            render turbo_stream: s
          }
          format.html { redirect_to instance }
        else
          format.turbo_stream {
            s = turbo_stream.replace helpers.dom_id(instance) do
              view_context.render(Categories::Title::FormComponent.new(object: decorate(instance)))
            end
            render turbo_stream: s, status: :unprocessable_entity
          }
          format.html { render Categories::Edit::ViewComponent.new(object: decorate(instance)), status: :unprocessable_entity }
        end
      end
    end

    private

    def permit_params
      [:related_tree_category_ids, :related_tree_by_category_ids,
       :related_category_ids, :related_by_category_ids,
       :suggested_category_ids, :suggested_by_category_ids].each do |p|
        params[:category][p].reject! { |c| c.empty? } if params[:category][p]
      end

      params
        .require(:category)
        .permit(
          :name,
          :categorization_id,
          :related_tree_category_ids => [],
          :related_tree_by_category_ids => [],
          :related_category_ids => [],
          :related_by_category_ids => [],
          :suggested_category_ids => [],
          :suggested_by_category_ids => []
        )
    end
  end
end
