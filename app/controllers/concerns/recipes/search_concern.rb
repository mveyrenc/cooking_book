module Recipes::SearchConcern
  extend ActiveSupport::Concern

  included do
    def do_search
      @search_params = search_recipes_params
      search_query = @search_params[:query].blank? ? '*' : @search_params[:query]
      @search_result = Recipe.search(
        search_query,
        where: { book_id: @book.id },
        page: params[:page],
        per_page: 10,
        order: {
          _score: :desc,
          created_at: :desc
        })

      render search_component
    end

    private

    def search_recipes_params
      params.permit(
        :query
      )
    end

    def search_component
      Recipes::Views::SearchComponent.new(
        book: @book,
        search_params: @search_params,
        search_result: @search_result
      )
    end
  end
end