module FormInputs
  class TextComponent < ActionView::Component::Base
    include FormInputs::Base

    validates :form, :method, presence: true

    def initialize(*args)
      initialize_input(args.extract_options!)
    end
  end
end