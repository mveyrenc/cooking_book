module Categories::SearchConcern
  extend ActiveSupport::Concern

  included do
    def search_categories
      @search_params = search_categories_params

      search_query = @search_params[:query].blank? ? "*" : @search_params[:query]
      search_options = {
          aggs: [
              :book_id,
              :categorization_id,
              :related_tree_categories_ids,
              :related_tree_by_categories_ids,
              :related_categories_ids,
              :related_by_categories_ids,
              :suggested_categories_ids,
              :suggested_by_categories_ids
          ],
          where: {},
          page: params[:page],
          per_page: 30,
          order: {
              _score: :desc,
              name: :asc
          },
          debug: true
      }

      unless @search_params[:categorization_id].blank?
        search_options[:where] = {categorization_id: @search_params[:categorization_id]}
      end
      unless @search_params[:book_id].blank?
        search_options[:where][:book_id] = @search_params[:book_id]
      end
      unless @search_params[:related_tree_category_id].blank?
        search_options[:where][:related_tree_categories_ids] = @search_params[:related_tree_category_id]
      end
      unless @search_params[:related_tree_by_category_id].blank?
        search_options[:where][:related_tree_by_categories_ids] = @search_params[:related_tree_by_category_id]
      end
      unless @search_params[:related_category_id].blank?
        search_options[:where][:related_categories_ids] = @search_params[:related_category_id]
      end
      unless @search_params[:related_by_category_id].blank?
        search_options[:where][:related_by_categories_ids] = @search_params[:related_by_category_id]
      end
      unless @search_params[:suggested_category_id].blank?
        search_options[:where][:suggested_categories_ids] = @search_params[:suggested_category_id]
      end
      unless @search_params[:suggested_by_category_id].blank?
        search_options[:where][:suggested_by_categories_ids] = @search_params[:suggested_by_category_id]
      end

      search_options.delete :where unless search_options[:where].any?

      @search_result = Category.search search_query, search_options

      @search_result.aggs['book_id']['buckets'].map! { |b| b.merge!({'object' => Book.find_by_id(b['key'])}) }
      @search_result.aggs['categorization_id']['buckets'].map! { |b| b.merge!({'object' => Categorization.find_by_id(b['key'])}) }
      @search_result.aggs['related_tree_categories_ids']['buckets'].map! { |b| b.merge!({'object' => Category.find_by_id(b['key'])}) }
      @search_result.aggs['related_tree_by_categories_ids']['buckets'].map! { |b| b.merge!({'object' => Category.find_by_id(b['key'])}) }
      @search_result.aggs['related_categories_ids']['buckets'].map! { |b| b.merge!({'object' => Category.find_by_id(b['key'])}) }
      @search_result.aggs['related_by_categories_ids']['buckets'].map! { |b| b.merge!({'object' => Category.find_by_id(b['key'])}) }
      @search_result.aggs['suggested_categories_ids']['buckets'].map! { |b| b.merge!({'object' => Category.find_by_id(b['key'])}) }
      @search_result.aggs['suggested_by_categories_ids']['buckets'].map! { |b| b.merge!({'object' => Category.find_by_id(b['key'])}) }
    end

    def search_categories_params
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