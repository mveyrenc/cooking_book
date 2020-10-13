class CategoriesController < ApplicationController

  include Categories::SearchConcern
  include Categories::CreateConcern
  include Categories::UpdateConcern
  include Categories::DestroyConcern

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  breadcrumb I18n.t('breadcrumb.categories'), :categories_path, match: :exact

  def index
    authorize! :read, Category
    search_categories
  end

  def show
    authorize! :read, @category
    breadcrumb @category.name, category_path(@category)
  end

  def new
    authorize! :create, Category
    @category = Category.new
  end

  def create
    authorize! :create, Category
    create_category
  end

  def edit
    authorize! :update, @category
    breadcrumb @category.name, category_path(@category)
  end

  def update
    authorize! :update, @category
    breadcrumb @category.name, category_path(@category)
    update_category
  end

  def destroy
    authorize! :destroy, @category
    destroy_category
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end
end
