module Categories::CreateConcern
  extend ActiveSupport::Concern

  included do
    def do_new
      render new_component
    end

    def do_create
      @category = Category.new(create_category_params)

      @category.author = current_user
      @category.modifier = current_user

      if @category.save
        redirect_to edit_category_path @category, flash: { notice: t('.success') }
      else
        render new_component
      end
    end

    private

    def create_category_params
      params.require(:category).permit(
        :name,
        :categorization_id
      )
    end

    def new_component
      Categories::Views::NewComponent.new(object: @category)
    end
  end
end