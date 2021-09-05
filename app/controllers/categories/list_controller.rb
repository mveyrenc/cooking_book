module Categories
  class ListController < SecuredController

    include ModelConcern

    def call
      authorize! :read, model_class
      breadcrumb I18n.t('breadcrumb.categories'), :categories_path, match: :exclusive

      s = {
        query: "*",
        where: {}
      }

      if permit_params[:search]
        s[:query] = permit_params[:search][:query] unless permit_params[:search][:query].blank?
        [
          :book_name,
          :categorization_name,
          :related_tree_categories_names,
          :related_tree_category_name,
          :related_tree_by_category_name,
          :related_category_name,
          :related_by_category_name,
          :suggested_category_name,
          :suggested_by_category_name
        ].each { |p| s[:where][p] = permit_params[:search][p] unless permit_params[:search][p].blank? }
      end

      result = model_class
                 .search s[:query],
                         aggs: [
                           :book_name,
                           :categorization_name,
                           :related_tree_categories_names,
                           :related_tree_by_categories_names,
                           :related_categories_names,
                           :related_by_categories_names,
                           :suggested_categories_names,
                           :suggested_by_categories_names
                         ],
                         where: s[:where],
                         page: params[:page],
                         per_page: 30,
                         order: {
                           _score: :desc,
                           name: :asc
                         }

      render Categories::Search::ViewComponent.new(
        query: permit_params[:search] || {},
        result: decorate_collection(result)
      )
    end

    private

    def permit_params
      params
        .permit(search: [
          :query,
          :book_name,
          :categorization_name,
          :related_tree_categories_names,
          :related_tree_by_categories_names,
          :related_categories_names,
          :related_by_categories_names,
          :suggested_categories_names,
          :suggested_by_categories_names
        ])
    end

  end
end
