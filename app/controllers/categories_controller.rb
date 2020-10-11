class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_search_params, only: [:index]

  breadcrumb I18n.t('breadcrumb.categories'), :categories_path, match: :exact

  # GET /categories
  # GET /categories.json
  def index
    authorize! :read, Category
    search_query = @search_params[:query].blank? ? "*" : @search_params[:query]
    search_options = {
        aggs: [
            :book_id,
            :categorization_id,
            :related_categories_ids,
            :related_by_categories_ids,
            :suggested_categories_ids,
            :suggested_by_categories_ids
        ],
        where: {},
        page: params[:page],
        per_page: 30,
        order: {
            _score: :desc,
            name: :asc
        },
        debug: true
    }

    unless @search_params[:categorization_id].blank?
      search_options[:where] = {categorization_id: @search_params[:categorization_id]}
    end
    unless @search_params[:book_id].blank?
      search_options[:where][:book_id] = @search_params[:book_id]
    end
    unless @search_params[:related_category_id].blank?
      search_options[:where][:related_categories_ids] = @search_params[:related_category_id]
    end
    unless @search_params[:related_by_category_id].blank?
      search_options[:where][:related_by_categories_ids] = @search_params[:related_by_category_id]
    end
    unless @search_params[:suggested_category_id].blank?
      search_options[:where][:suggested_categories_ids] = @search_params[:suggested_category_id]
    end
    unless @search_params[:suggested_by_category_id].blank?
      search_options[:where][:suggested_by_categories_ids] = @search_params[:suggested_by_category_id]
    end
    search_options.delete :where unless search_options[:where].any?

    @search_result = Category.search search_query, search_options

    @search_result.aggs['book_id']['buckets'].map! { |b| b.merge!({'object' => Book.find_by_id(b['key'])}) }
    @search_result.aggs['categorization_id']['buckets'].map! { |b| b.merge!({'object' => Categorization.find_by_id(b['key'])}) }
    @search_result.aggs['related_categories_ids']['buckets'].map! { |b| b.merge!({'object' => Category.find_by_id(b['key'])}) }
    @search_result.aggs['related_by_categories_ids']['buckets'].map! { |b| b.merge!({'object' => Category.find_by_id(b['key'])}) }
    @search_result.aggs['suggested_categories_ids']['buckets'].map! { |b| b.merge!({'object' => Category.find_by_id(b['key'])}) }
    @search_result.aggs['suggested_by_categories_ids']['buckets'].map! { |b| b.merge!({'object' => Category.find_by_id(b['key'])}) }
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    authorize! :read, @category
    breadcrumb @category.name, category_path(@category)
  end

  # GET /categories/new
  def new
    authorize! :create, Category
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    breadcrumb @category.name, category_path(@category)
  end

  # POST /categories
  # POST /categories.json
  def create
    authorize! :create, Category

    @category = Category.new(category_params)

    @category.author = current_user
    @category.modifier = current_user

    respond_to do |format|
      if @category.save
        format.html { redirect_to edit_category_path @category, notice: t('.success') }
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
    authorize! :update, @category
    breadcrumb @category.name, category_path(@category)

    @category.modifier = current_user

    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: t('.success') }
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
    authorize! :destroy, @category
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def set_search_params
    @search_params = category_search_params
  end

  def category_search_params
    params.permit(
        :query,
        :book_id,
        :categorization_id,
        :related_category_id,
        :related_by_category_id,
        :suggested_category_id,
        :suggested_by_category_id
    )
  end

  def category_params
    params[:category][:related_tree_category_ids].reject! { |c| c.empty? } if params[:category][:related_tree_category_ids]
    params[:category][:related_tree_by_category_ids].reject! { |c| c.empty? } if params[:category][:related_tree_by_category_ids]
    params[:category][:related_category_ids].reject! { |c| c.empty? } if params[:category][:related_category_ids]
    params[:category][:related_by_category_ids].reject! { |c| c.empty? } if params[:category][:related_by_category_ids]
    params[:category][:suggested_category_ids].reject! { |c| c.empty? } if params[:category][:suggested_category_ids]
    params[:category][:suggested_by_category_ids].reject! { |c| c.empty? } if params[:category][:suggested_by_category_ids]

    params.require(:category).permit(
        :name,
        :categorization_id,
        :related_tree_category_ids => [],
        :related_tree_by_category_ids => [],
        :related_category_ids => [],
        :related_by_category_ids => [],
        :suggested_category_ids => [],
        :suggested_by_category_ids => []
    )
  end
end
