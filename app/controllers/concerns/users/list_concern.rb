module Users::ListConcern
  extend ActiveSupport::Concern

  included do
    def do_list
      @users = User.all

      render list_component
    end

    private

    def list_component
      Users::Views::ListComponent.new(
        objects: @users
      )
    end
  end
end