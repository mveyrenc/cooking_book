module Recipes
  class DestroyController < SecuredController

    include FriendlyInstanceConcern

    def call
      authorize! :destroy, instance

      instance.destroy
      flash.now[:notice] = t('.success')
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(instance) }
        format.html { redirect_to recipes_path(instance.book) }
      end
    end
  end
end
