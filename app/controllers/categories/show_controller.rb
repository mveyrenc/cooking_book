module Categories
  class ShowController < SecuredController

    include InstanceConcern

    def call
      authorize! :read, instance
      breadcrumb I18n.t('breadcrumb.categories'), :categories_path, match: :exclusive
      breadcrumb instance.name, category_path(instance)

      render Categories::Show::ViewComponent.new(object: decorate(instance))
    end
  end
end
