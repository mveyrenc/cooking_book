class ImportRecipeController < SecuredController

  before_action :set_book

  def index
    authorize! :create, Recipe

    breadcrumb I18n.t('breadcrumb.import_recipe'), book_path(@book)

    @recipe = nil
    @url = nil

    render Recipes::Views::ViewComponent.new(book: @book, url: @url, object: @recipe)
  end

  def create
    authorize! :create, Recipe

    breadcrumb I18n.t('breadcrumb.import_recipe'), book_path(@book)

    @recipe = nil
    @url = import_recipe_params[:url]
    if @url.blank?
      flash.now[:danger] = 'recipes.import_url_error.invalid_url'
    else
      begin
        @recipe = RecipeImport.import(@book, @url, current_user)
      rescue RecipeImport::UnknownTagError => e
        flash.now[:danger] = 'recipes.import_url_error.unknown_recipe_provider'
      rescue => e
        flash.now[:danger] = e.message

        print e.full_message
      end
    end

    if @recipe.nil?
      render Recipes::Views::ViewComponent.new(book: @book, url: @url, object: @recipe)
    elsif @recipe.save
      flash.now[:notice] = t('recipes.create.success')
      redirect_to recipe_path(@recipe)
    else
      @recipe.errors.full_messages.each do |e|
        flash.now[:danger] = e.message

        print e.full_message
      end

      render Recipes::Views::ViewComponent.new(book: @book, url: @url, object: @recipe)
    end
  end

  private

  def set_book
    @book = Book.friendly.find(params[:book])
    breadcrumb @book.name, book_path(@book), match: :exclusive
    breadcrumb I18n.t('breadcrumb.recipes'), book_path(@book), match: :exclusive
  end

  def import_recipe_params
    params.permit(:url, :authenticity_token, :commit)
  end

end
