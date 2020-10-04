module Users
  class FormComponent < ViewComponent::Base
    def initialize(object:)
      @object = object
    end

    private

    attr_reader :object
  end
end