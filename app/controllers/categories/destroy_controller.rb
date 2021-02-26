module Categories
  class DestroyController < SecuredController

    include InstanceConcern

    def call
      authorize! :destroy, instance

      instance.destroy

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(helpers.dom_id(instance)) }
        format.html         { redirect_to categories_url, flash: { notice: t('.success') } }
      end
    end
  end
end
