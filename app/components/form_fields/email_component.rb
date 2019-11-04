module FormFields
  class EmailComponent < ActionView::Component::Base
    include FormFields::Base

    validates :form, :method, presence: true

    alias_method :options, :input_options

    def initialize(*args)
      initialize_fields(args.extract_options!)
    end
  end
end