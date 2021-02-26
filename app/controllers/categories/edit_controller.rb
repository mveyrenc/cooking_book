module Categories
  class EditController < SecuredController

    include InstanceConcern

    def call
      authorize! :update, instance
      breadcrumb instance.name, category_path(instance)

      render Categories::Edit::ViewComponent.new(object: decorate(instance))
    end
  end
end
