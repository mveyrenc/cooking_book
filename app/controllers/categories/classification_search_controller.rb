module Categories
  class ClassificationSearchController < SecuredController

    include FriendlyInstanceConcern

    def call
      authorize! :read, model_class

      result = Category.search(search_term,
                               where: search_where_option,
                               per_page: 30,
                               order: {
                                 _score: :desc,
                                 name: :asc
                               })

      render Categories::Classification::SearchComponent.new(
        object: decorate(instance),
        query: permit_params,
        result: decorate_collection(result)
      )
    end

    private

    def permit_params
      params
        .require(:search)
        .permit(
          :query
        )
    end

    def search_term
      permit_params[:query].blank? ? "*" : permit_params[:query]
    end

    def search_where_option
      {
        id: { not: exclude_categories },
        book_id: instance.categorization.book.id
      }
    end

    def exclude_categories
      c = [instance.id]
      c.concat instance.related_tree_categories.select(:id).map { |c| c.id }
      c.concat instance.related_tree_categories.select(:id).map { |c| c.id }
      c.concat instance.related_tree_by_categories.select(:id).map { |c| c.id }
      c.concat instance.related_categories.select(:id).map { |c| c.id }
      c.concat instance.related_by_categories.select(:id).map { |c| c.id }
      c.concat instance.suggested_categories.select(:id).map { |c| c.id }
      c.concat instance.suggested_by_categories.select(:id).map { |c| c.id }
      c.concat instance.extra_related_categories.map { |c| c.id }
      c.uniq
    end

  end
end
