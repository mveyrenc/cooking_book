class RecipesController < SecuredController

  include Recipes::SearchConcern
  include Recipes::CreateConcern
  include Recipes::UpdateConcern
  include Recipes::DestroyConcern

  authorize_resource

  before_action :set_book

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  before_action :set_part, only: [:show, :edit, :update]

  def index
    authorize! :read, Recipe
    search_recipes
  end

  def show
    authorize! :read, @book.recipes
    breadcrumb @recipe.name, book_recipe_path(@book, @recipe)
  end

  def new
    authorize! :create, Recipe
    @part = Recipes::Parts::DetailComponent::PART_RECIPE
    @recipe = Recipe.new(book: @book)
  end

  def create
    authorize! :create, Recipe
    @part = Recipes::Parts::DetailComponent::PART_RECIPE
    create_recipe
  end

  def edit
    authorize! :update, @recipe
    breadcrumb @recipe.name, book_recipe_path(@book, @recipe)
  end

  def update
    authorize! :update, @recipe
    breadcrumb @recipe.name, book_recipe_path(@book, @recipe)
    update_recipe
  end

  def destroy
    authorize! :destroy, @recipe
    destroy_recipe
  end

  private

  def set_book
    @book = Book.friendly.find(params[:book_id])
    breadcrumb I18n.t('breadcrumb.recipes'), book_path(@book)
    breadcrumb @book.name, book_path(@book), match: :exact
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
