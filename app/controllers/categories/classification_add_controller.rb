module Categories
  class ClassificationAddController < SecuredController

    include FriendlyInstanceConcern

    def call
      authorize! :update, instance
      breadcrumb instance.name, category_path(instance)

      related = model_class
                  .where(
                    "book = ? AND categorization = ? AND lower(name) = ?",
                    permit_params[:book],
                    permit_params[:categorization],
                    permit_params[:name].downcase
                  )
                  .first
      unless related
        related = model_class.create(
          book: permit_params[:book],
          categorization: permit_params[:categorization],
          name: permit_params[:name],
          author: current_user,
          modifier: current_user,
        )
      end

      respond_to do |format|
        flash.now[:notice] = t('.success')
        if related and instance.send(permit_params[:relation_type]) << related
          instance.send(permit_params[:relation_type]).replace(
            instance.send(permit_params[:relation_type]).distinct
          )
          format.turbo_stream {
            s = turbo_stream.replace "#{helpers.dom_id(instance)}_classification" do
              view_context.render(Categories::Classification::ManageComponent.new(object: decorate(instance), last_add: decorate(related)))
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
          :book,
          :categorization,
          :name,
          :relation_type
        )
    end
  end
end
