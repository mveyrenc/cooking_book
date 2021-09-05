module Recipes
  class ListController < SecuredController

    include ModelConcern

    def call
      authorize! :read, model_class
      breadcrumb I18n.t('breadcrumb.recipes'), :recipes_path, match: :exclusive

      s = {
        query: "*",
        where: {}
      }

      if permit_params[:search]
        s[:query] = permit_params[:search][:query] unless permit_params[:search][:query].blank?
        [
          :book_name,
          :categories_names,
        ].each { |p| s[:where][p] = permit_params[:search][p] unless permit_params[:search][p].blank? }
      end

      result = model_class
                 .search s[:query],
                         aggs: [
                           :book_name,
                           :categories_names,
                         ],
                         includes: [:categories],
                         where: s[:where],
                         page: params[:page],
                         per_page: 30,
                         order: {
                           _score: :desc,
                           name: :asc
                         }

      render Recipes::Search::ViewComponent.new(
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
          :categories_names,
        ])
    end

  end
end
