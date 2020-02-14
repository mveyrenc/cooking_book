module Bulma
  module Elements
    module Notification
      class Notification < ActionView::Component::Base

        include ActionView::Helpers

        def initialize(
            html_options: {},
            delete: true,
            delete_size: nil
        )
          @html_options = html_options
          @html_options[:class] = @html_options.fetch(:class, '').prepend('notification ')

          @delete = delete
          @delete_size = delete_size
        end

        private

        attr_reader :html_options
        attr_reader :delete_size

        def delete?
          html_options.fetch(:delete, true)
        end

      end
    end
  end
end