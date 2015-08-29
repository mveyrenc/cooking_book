class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    if params[:search] 
      @categories = Category.includes(:related_categories, :suggested_categories).where("lower(name) LIKE :search",{search: "%#{params[:search].downcase}%"}).order( :name )
    else
      @categories = Category.includes(:related_categories, :suggested_categories).all.order( :name )
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url + '#' + @category.slug, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_url + '#' + @category.slug, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params[:category][:related_category_ids].reject! { |c| c.empty? } if params[:category][:related_category_ids]
    params[:category][:related_by_category_ids].reject! { |c| c.empty? } if params[:category][:related_by_category_ids]
    params[:category][:suggested_category_ids].reject! { |c| c.empty? } if params[:category][:suggested_category_ids]
    params[:category][:suggested_by_category_ids].reject! { |c| c.empty? } if params[:category][:suggested_by_category_ids]
    
    params.require(:category).permit(:name, :is_course_type, :related_category_ids => [], :related_by_category_ids => [], :suggested_category_ids => [], :suggested_by_category_ids => [])
  end
end
