module Categories::UpdateConcern
  extend ActiveSupport::Concern

  included do
    def do_edit
      render edit_component
    end

    def do_update
      @category.modifier = current_user

      if @category.update(update_category_params)
        redirect_to @category, flash: { notice: t('.success') }
      else
        render edit_component
      end
    end

    private

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

    def edit_component
      Categories::Views::EditComponent.new(object: @category)
    end
  end
end