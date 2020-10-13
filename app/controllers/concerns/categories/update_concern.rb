module Categories::UpdateConcern
  extend ActiveSupport::Concern

  included do
    def update_category
      @category.modifier = current_user

      respond_to do |format|
        if @category.update(update_category_params)
          format.html { redirect_to @category, notice: t('.success') }
          format.json { render :show, status: :ok, location: @category }
        else
          format.html { render :edit }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    def update_category_params
      [:related_tree_category_ids, :related_tree_by_category_ids,
       :related_category_ids, :related_by_category_ids,
       :suggested_category_ids, :suggested_by_category_ids].each do |p|
        params[:category][p].reject! { |c| c.empty? } if params[:category][p]
      end

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
end