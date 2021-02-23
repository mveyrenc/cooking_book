class CategoriesController < SecuredController

  include Categories::SearchConcern
  include Categories::ShowConcern
  include Categories::CreateConcern
  include Categories::UpdateConcern
  include Categories::DestroyConcern

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  breadcrumb I18n.t('breadcrumb.categories'), :categories_path, match: :exclusive

  def index
    authorize! :read, Category
    do_search
  end

  def show
    authorize! :read, @category
    breadcrumb @category.name, category_path(@category)
    do_show
  end

  def new
    authorize! :create, Category
    @category = Category.new
    do_new
  end

  def create
    authorize! :create, Category
    do_create
  end

  def edit
    authorize! :update, @category
    breadcrumb @category.name, category_path(@category)
    do_edit
  end

  def update
    authorize! :update, @category
    breadcrumb @category.name, category_path(@category)
    do_update
  end

  def destroy
    authorize! :destroy, @category
    do_destroy
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end
end
