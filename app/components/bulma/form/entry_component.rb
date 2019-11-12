module Bulma
  module Form
    class EntryComponent < ActionView::Component::Base
      include Bulma::Form::Entry

      validates :form, :method, presence: true

      def initialize(*args)
        initialize_entry(args.extract_options!)
      end
    end
  end
end