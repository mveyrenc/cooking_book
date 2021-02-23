module Users::ShowConcern
  extend ActiveSupport::Concern

  included do
    def do_show
      render show_component
    end

    private

    def show_component
      Users::Views::ShowComponent.new(object: @user)
    end
  end
end