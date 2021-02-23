class UsersController < SecuredController

  include Users::ListConcern
  include Users::ShowConcern
  include Users::UpdateConcern
  include Users::DestroyConcern

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  breadcrumb I18n.t('breadcrumb.users'), :users_path, match: :exclusive

  def index
    authorize! :read, User
    do_list
  end

  def show
    authorize! :read, User
    breadcrumb @user.name, user_path(@user)
    do_show
  end

  def edit
    authorize! :update, @user
    breadcrumb @user.name, user_path(@user)
    do_edit
  end

  def update
    authorize! :update, @user
    breadcrumb @user.name, user_path(@user)
    do_update
  end

  def destroy
    authorize! :destroy, @user
    @user.destroy
    do_destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
