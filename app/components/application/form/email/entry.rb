module Application
  module Form
    module Email
      class Entry < ViewComponent::Base
        include Application::Form::EntryBase

        def initialize(*args)
          initialize_entry(**args.extract_options!)
        end
      end
    end
  end
end