module Recipes
  class ListController < SecuredController

    include ModelConcern

    def call
      authorize! :read, model_class
      breadcrumb instance.name, recipes_path(instance)

      search_params = permit_params

      search_query = search_params[:query].blank? ? '*' : search_params[:query]
      search_result = model_class.search(
        search_query,
        where: { book_id: instance.id },
        page: params[:page],
        per_page: 10,
        order: {
          _score: :desc,
          created_at: :desc
        })

      render Recipes::Search::ViewComponent.new(
        book: instance,
        search_params: search_params,
        search_result: decorate_collection(search_result)
      )
    end

    private

    def instance
      Book.friendly.find(params[:id])
    end

    def permit_params
      params.permit(
        :query,
        :book_id,
        :categorization_id,
        :related_tree_category_id,
        :related_tree_by_category_id,
        :related_category_id,
        :related_by_category_id,
        :suggested_category_id,
        :suggested_by_category_id
      )
    end

  end
end
