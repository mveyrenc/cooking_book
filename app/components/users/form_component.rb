module Users
  class FormComponent < ViewComponent::Base
    def initialize(item:)
      @object = item
    end

    private

    attr_reader :object
  end
end