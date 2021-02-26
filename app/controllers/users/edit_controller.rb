module Users
  class EditController < SecuredController

    include InstanceConcern

    def call
      authorize! :update, instance
      breadcrumb instance.name, category_path(instance)


      render Users::Edit::FormComponent.new(object: decorate(instance))
    end
  end
end
