class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @query = params[:query]
    @search_result = Recipe.search do
      fulltext params[:query]
      if params[:category_ids].present?
        all_of do
          params[:category_ids].each do |filter|
            with(:category_ids, filter)
          end
        end
      end
      if params[:exclu_category_ids].present?
        all_of do
          params[:exclu_category_ids].each do |filter|
            without(:category_ids, filter)
          end
        end
      end
      if params[:main_ingredient_ids].present?
        all_of do
          params[:main_ingredient_ids].each do |filter|
            with(:main_ingredient_ids, filter)
          end
        end
      end
      if params[:exclu_main_ingredient_ids].present?
        all_of do
          params[:exclu_main_ingredient_ids].each do |filter|
            without(:main_ingredient_ids, filter)
          end
        end
      end
      if params[:sources].present?
        all_of do
          params[:sources].each do |filter|
            with(:sources, filter)
          end
        end
      end
      if params[:exclu_sources].present?
        all_of do
          params[:exclu_sources].each do |filter|
            without(:sources, filter)
          end
        end
      end
      facet :dish_type_id unless params[:dish_type_id].present?
      facet :category_ids #unless params[:category_ids].present?
      facet :main_ingredient_ids #unless params[:main_ingredient_ids].present?
      facet :sources #unless params[:source].present?
      paginate :page => params[:page] || 1, :per_page => 10
      order_by(:score, :desc)
      order_by(:created_at, :desc)
    end
    @query_params = params.except( :page )
    
    filters = [:category_ids, :main_ingredient_ids, :exclu_category_ids, :exclu_main_ingredient_ids]
    filters.each do |filter|
      if params[filter].present?
        params[filter].map!{ |x| x.to_i }
      end
    end
    
    @search_result.facet(:main_ingredient_ids).rows.sort!{|a,b| (a.count <=> b.count) == 0 ? (a.instance.name <=> b.instance.name) : (a.count <=> b.count)*(-1) }
    @search_result.facet(:category_ids).rows.sort!{|a,b| (a.count <=> b.count) == 0 ? (a.instance.name <=> b.instance.name) : (a.count <=> b.count)*(-1) }
    @search_result.facet(:sources).rows.sort!{|a,b| (a.count <=> b.count) == 0 ? (a.value <=> b.value) : (a.count <=> b.count)*(-1) }
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    logger.debug recipe_params
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
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
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
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
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
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
    params.require(:recipe).permit(:name, :dish_type_id, {:category_ids => []}, :description, :picture, :times, :quantity, :ingredients, {:main_ingredient_ids => []}, :directions, :source, :wine)
  end
end
