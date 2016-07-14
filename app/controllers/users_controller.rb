class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :read, User
    @users = User.all
  end

  def show
    authorize! :read, User
  end

  def new
    authorize! :create, User
    @user = User.new
  end

  def edit
    authorize! :update, @user
  end

  def create
    authorize! :create, User
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update, @user
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    if params[:user][:password].blank?
      params.require(:user).permit(:name, :email, :role)
    else
      params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
    end
  end
end
