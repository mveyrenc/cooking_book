module Users
  class FormComponent < ApplicationComponent
    def initialize(object:)
      @object = object
    end

    private

    attr_reader :object
  end
end