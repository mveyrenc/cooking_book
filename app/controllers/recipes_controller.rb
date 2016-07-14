class RecipesController < ApplicationController
  
  authorize_resource
  
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    authorize! :read, Recipe
    @query = params[:query]
    @search_result = Recipe.search do
      fulltext params[:query]
      if params[:course_type_ids].present?
        all_of do
          params[:course_type_ids].each do |filter|
            with(:course_type_ids, filter)
          end
        end
      end
      if params[:exclu_course_type_ids].present?
        all_of do
          params[:exclu_course_type_ids].each do |filter|
            without(:course_type_ids, filter)
          end
        end
      end
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
      if params[:source_ids].present?
        all_of do
          params[:source_ids].each do |filter|
            with(:source_ids, filter)
          end
        end
      end
      if params[:exclu_source_ids].present?
        all_of do
          params[:exclu_source_ids].each do |filter|
            without(:source_ids, filter)
          end
        end
      end
      facet :course_type_ids
      facet :category_ids
      facet :main_ingredient_ids
      facet :source_ids
      paginate :page => params[:page] || 1, :per_page => 10
      order_by(:score, :desc)
      order_by(:created_at, :desc)
    end
    @query_params = params.except( :page )
    
    filters = [:course_type_ids, :category_ids, :main_ingredient_ids, :source_ids, :exclu_course_type_ids, :exclu_category_ids, :exclu_main_ingredient_ids, :exclu_source_ids]
    filters.each do |filter|
      if params[filter].present?
        params[filter].map!{ |x| x.to_i }
      end
    end
    
    @search_result.facet(:main_ingredient_ids).rows.sort!{|a,b| (a.count <=> b.count) == 0 ? (a.instance.name <=> b.instance.name) : (a.count <=> b.count)*(-1) }
    @search_result.facet(:course_type_ids).rows.sort!{|a,b| (a.count <=> b.count) == 0 ? (a.instance.name <=> b.instance.name) : (a.count <=> b.count)*(-1) }
    @search_result.facet(:category_ids).rows.sort!{|a,b| (a.count <=> b.count) == 0 ? (a.instance.name <=> b.instance.name) : (a.count <=> b.count)*(-1) }
    @search_result.facet(:source_ids).rows.sort!{|a,b| (a.count <=> b.count) == 0 ? (a.instance.name <=> b.instance.name) : (a.count <=> b.count)*(-1) }
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
    @course_types = Category.course_type.ordered
    @categories = Category.categories.ordered
  end

  # GET /recipes/1/edit
  def edit
    authorize! :update, @recipe
    @course_types = Category.course_type.ordered
    @categories = Category.categories.ordered
  end

  # POST /recipes
  # POST /recipes.json
  def create
    authorize! :create, Recipe
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
    authorize! :update, @recipe
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
    authorize! :destroy, @recipe
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
    params.require(:recipe).permit(:name, {:category_ids => []}, :description, :picture, :times, :quantity, :ingredients, {:main_ingredient_ids => []}, :directions, {:source_ids => []}, :wine)
  end
end
