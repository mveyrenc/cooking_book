class RecipesController < ApplicationController

  authorize_resource

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    authorize! :read, Recipe
    @query = params[:query]
    search_query = @query ? @query : '*'
    @search_result = Recipe.search search_query,
                                   page: params[:page],
                                   per_page: 10,
                                   order: {
                                       _score: :desc,
                                       created_at: :desc
                                   }
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    authorize! :read, Recipe
  end

  # GET /recipes/new
  def new
    authorize! :create, Recipe
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    authorize! :update, @recipe
  end

  # POST /recipes
  # POST /recipes.json
  def create
    authorize! :create, Recipe

    @recipe = Recipe.new(recipe_params)
    @recipe.author = current_user
    @recipe.modifier = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: t('.success') }
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

    @recipe.modifier = current_user

    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: t('.success') }
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
      format.html { redirect_to recipes_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_params
    params.require(:recipe).permit(:name, {:category_ids => []}, :description, :picture, :times, :quantity,
                                   :ingredients, {:main_ingredient_ids => []}, :directions, {:source_ids => []}, :wine, :difficulty, :cost)
  end

  def sort_alphabetical(facet)
    facet.sort! do |w1, w2|
      SortAlphabetical.normalize(w1.instance.name) <=> SortAlphabetical.normalize(w2.instance.name)
    end
  end
end
