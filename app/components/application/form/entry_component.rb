module Application
  module Form
    class EntryComponent < ViewComponent::Base
      include Application::Form::EntryBaseComponent

      def initialize(*args)
        initialize_entry(**args.extract_options!)
      end
    end
  end
end