class ImportRecipeController < ApplicationController

  before_action :set_book

  def index
    authorize! :create, Recipe

    @recipe = nil
    @url = nil
  end

  def create
    authorize! :create, Recipe

    @recipe = nil
    @url = import_recipe_params[:url]
    if @url.blank?
      flash[:danger] = 'recipes.import_url_error.invalid_url'
    else
      begin
        @recipe = RecipeImport.import(@book, @url, current_user)
      rescue RecipeImport::UnknownTagError => e
        flash[:danger] = 'recipes.import_url_error.unknown_recipe_provider'
      rescue => e
        flash[:danger] = e.message

        print e.full_message
      end
    end

    respond_to do |format|
      if @recipe.nil?
        format.html { render :index }
      elsif @recipe.save
        format.html { redirect_to edit_book_recipe_path(@book, @recipe), notice: t('recipes.create.success') }
        format.json { render :show, status: :created, location: @recipe }
      else
        @recipe.errors.full_messages.each do |e|
          flash[:danger] = e.message

          print e.full_message
        end

        format.html { render :index }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_book
    @book = Book.friendly.find(params[:book_id])
  end

  def import_recipe_params
    params.permit(:url, :authenticity_token, :commit)
  end


end
