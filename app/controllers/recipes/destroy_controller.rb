module Recipes
  class DestroyController < SecuredController

    include InstanceConcern

    def call
      authorize! :destroy, instance

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(instance) }
        format.html         { redirect_to recipes_path(instance.book), flash: { notice: t('.success') } }
      end
    end
  end
end
