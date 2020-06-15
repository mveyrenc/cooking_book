module Bulma
  module Form
    class Entry < ViewComponent::Base
      include Bulma::Form::EntryBase

      def initialize(*args)
        initialize_entry(**args.extract_options!)
      end
    end
  end
end