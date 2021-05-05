module Users
  class DestroyController < SecuredController

    include InstanceConcern

    def call
      authorize! :destroy, instance

      instance.destroy
      flash.now[:notice] = t('.success')

      redirect_to users_url
    end
  end
end
