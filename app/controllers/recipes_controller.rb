class RecipesController < SecuredController

  include Recipes::SearchConcern
  include Recipes::ShowConcern
  include Recipes::CreateConcern
  include Recipes::UpdateConcern
  include Recipes::DestroyConcern

  before_action :set_book
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :set_part, only: [:show, :edit, :update]

  def index
    authorize! :read, Recipe
    do_search
  end

  def show
    authorize! :read, @book.recipes
    breadcrumb @recipe.name, book_recipe_path(@book, @recipe)
    do_show
  end

  def new
    authorize! :create, Recipe
    @part = Recipes::Parts::DetailComponent::PART_RECIPE
    @recipe = Recipe.new(book: @book)
    do_new
  end

  def create
    authorize! :create, Recipe
    @part = Recipes::Parts::DetailComponent::PART_RECIPE
    do_create
  end

  def edit
    authorize! :update, @recipe
    breadcrumb @recipe.name, book_recipe_path(@book, @recipe)
    do_edit
  end

  def update
    authorize! :update, @recipe
    breadcrumb @recipe.name, book_recipe_path(@book, @recipe)
    update_recipe
  end

  def destroy
    authorize! :destroy, @recipe
    do_destroy
  end

  private

  def set_book
    @book = Book.friendly.find(params[:book_id])
    breadcrumb @book.name, book_path(@book), match: :exclusive
    breadcrumb I18n.t('breadcrumb.recipes'), book_path(@book), match: :exclusive
  end

  def set_recipe
    @recipe = @book.recipes.friendly.find(params[:id])
  end

  def set_part
    @part = params[:part] || Recipes::Parts::DetailComponent::PART_RECIPE
  end

  # def sort_alphabetical(facet)
  #   facet.sort! do |w1, w2|
  #     SortAlphabetical.normalize(w1.instance.name) <=> SortAlphabetical.normalize(w2.instance.name)
  #   end
  # end
end
