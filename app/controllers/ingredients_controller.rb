class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      search = params[:search].downcase
      @ingredients = Ingredient.where("lower(name) LIKE :search",{search: "#{search}%"}).order( :name ) + Ingredient.where("lower(name) LIKE :search_like AND lower(name) NOT LIKE :search_not_like",{search_like: "%#{search}%", search_not_like: "#{search}%"}).order( :name )
    else
      @ingredients = Ingredient.roots
    end
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
    @ingredient.parent_id = params[:parent_id] if params[:parent_id]
  end

  def edit
  end

  def create
    logger.debug ingredient_params
    @ingredient = Ingredient.new(ingredient_params)
    
    respond_to do |format|
      if @ingredient.save
        anchor = @ingredient.is_root? ? @ingredient.slug : @ingredient.parent.slug
        format.html { redirect_to ingredients_url + '#' + anchor, notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to ingredients_url + '#' + @ingredient.slug, notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ingredient.destroy
    respond_to do |format|
      anchor = @ingredient.is_root? ? '' : '#' + @ingredient.parent.slug
      format.html { redirect_to ingredients_url + anchor, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_ingredient
    @ingredient = Ingredient.friendly.find(params[:id])
  end

  def ingredient_params
    if params[:best_months].present?
      params[:best_months].map!{ |m| m.to_i }
    end
    if params[:worse_months].present?
      params[:worse_months].map!{ |m| m.to_i }
    end
    params.require(:ingredient).permit(:name, :parent_id, {:best_months => []}, {:worse_months => []})
  end
end
