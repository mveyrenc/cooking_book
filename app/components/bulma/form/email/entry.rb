module Bulma
  module Form
    module Email
      class Entry < ActionView::Component::Base
        include Bulma::Form::EntryBase

        validates :form, :method, presence: true

        def initialize(*args)
          initialize_entry(args.extract_options!)
        end
      end
    end
  end
end