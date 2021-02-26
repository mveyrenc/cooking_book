module Users
  class ShowController < SecuredController

    include InstanceConcern

    def call
      authorize! :read, instance
      breadcrumb instance.name, user_path(instance)

      render Users::Show::FormComponent.new(object: decorate(instance))
    end
  end
end
