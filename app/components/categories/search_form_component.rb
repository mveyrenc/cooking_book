module Categories
  class SearchFormComponent < ViewComponent::Base
    def initialize(search_params:, search_result:)
      @search_params = search_params
      @search_result = search_result
    end

    private

    attr_reader :search_params
    attr_reader :search_result
  end
end