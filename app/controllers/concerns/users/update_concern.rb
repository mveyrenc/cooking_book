module Users::UpdateConcern
  extend ActiveSupport::Concern

  included do
    def do_edit
      render edit_component
    end

    def do_update
      if update_user_params[:password].blank?
        update_user_params.delete(:password)
        update_user_params.delete(:password_confirmation)
      end

      if @user.update(update_user_params)
        redirect_to users_url, flash: { notice: t('.success') }
      else
        render edit_component
      end
    end

    private

    def update_user_params
      if params[:user][:password].blank?
        params.require(:user).permit(:name, :email, :role)
      else
        params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
      end
    end

    def edit_component
      Users::Views::EditComponent.new(object: @user)
    end
  end
end