module Categories::CreateConcern
  extend ActiveSupport::Concern

  included do
    def create_category
      @category = Category.new(create_category_params)

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

    def create_category_params
      params.require(:category).permit(
          :name,
          :categorization_id
      )
    end
  end
end