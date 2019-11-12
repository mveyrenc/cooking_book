module Users
  class Card < ActionView::Component::Base
    include Devise::Controllers::Helpers
    include CanCan::ControllerAdditions

    validates :object, presence: true

    def initialize(object:)
      @object = object
    end

    private

    attr_reader :object
  end
end