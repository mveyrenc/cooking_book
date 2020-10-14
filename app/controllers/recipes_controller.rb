class RecipesController < SecuredController

  authorize_resource

  before_action :set_book

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    authorize! :read, Recipe
    @search_params = params
    search_query = @search_params[:query] ? @search_params[:query] : '*'
    @search_result = Recipe.search(
        search_query,
        where: {book_id: @book.id},
        page: params[:page],
        per_page: 10,
        order: {
            _score: :desc,
            created_at: :desc
        })
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    authorize! :read, @book.recipes
    breadcrumb @recipe.name, book_recipe_path(@book, @recipe)
  end

  # GET /recipes/new
  def new
    authorize! :create, Recipe
    @recipe = Recipe.new(book: @book)
  end

  # GET /recipes/1/edit
  def edit
    authorize! :update, @recipe
    breadcrumb @recipe.name, book_recipe_path(@book, @recipe)
  end

  # POST /recipes
  # POST /recipes.json
  def create
    authorize! :create, Recipe

    @recipe = Recipe.new(recipe_params)
    @recipe.book = @book
    @recipe.author = current_user
    @recipe.modifier = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to [@book, @recipe], notice: t('.success') }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    authorize! :update, @recipe

    breadcrumb @recipe.name, book_recipe_path(@book, @recipe)

    @recipe.modifier = current_user
    @recipe.book = @book

    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to [@book, @recipe], notice: t('.success') }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    authorize! :destroy, @recipe
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to @book, notice: t('.success') }
      format.json { head :no_content }
    end
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

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_params
    params.require(:recipe).permit(
        :name,
        {:category_ids => []},
        :description,
        :picture,
        :times,
        :quantity,
        :ingredients,
        {:main_ingredient_ids => []},
        :directions,
        {:source_ids => []},
        :wine,
        :difficulty,
        :cost
    )
  end

  def sort_alphabetical(facet)
    facet.sort! do |w1, w2|
      SortAlphabetical.normalize(w1.instance.name) <=> SortAlphabetical.normalize(w2.instance.name)
    end
  end
end
