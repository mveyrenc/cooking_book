module Users
  class UpdateController < SecuredController

    include InstanceConcern

    def call
      authorize! :update, instance
      breadcrumb instance.name, category_path(instance)

      if permit_params[:password].blank?
        permit_params.delete(:password)
        permit_params.delete(:password_confirmation)
      end

      if instance.update(permit_params)
        redirect_to users_url, flash: { notice: t('.success') }
      else
        render Users::Edit::FormComponent.new(object: decorate(instance))
      end
    end

    private

    def permit_params
      if params[:user][:password].blank?
        params.require(:user).permit(:name, :email, :role)
      else
        params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
      end
    end
  end
end
