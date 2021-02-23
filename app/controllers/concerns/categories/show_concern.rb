module Categories::ShowConcern
  extend ActiveSupport::Concern

  included do
    def do_show
      render show_component
    end

    private

    def show_component
      Categories::Views::ShowComponent.new(object: @category)
    end
  end
end