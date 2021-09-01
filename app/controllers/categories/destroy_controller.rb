module Categories
  class DestroyController < SecuredController

    include FriendlyInstanceConcern

    def call
      authorize! :destroy, instance

      instance.destroy
      flash.now[:notice] = t('.success')

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(helpers.dom_id(instance)) }
        format.html { redirect_to categories_url }
      end
    end
  end
end
