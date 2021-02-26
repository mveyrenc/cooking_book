module Categories
  class NewController < SecuredController

    include ModelConcern

    def call
      authorize! :create, model_class
      breadcrumb I18n.t('breadcrumb.categories'), :categories_path, match: :exclusive
      instance = new_instance

      render Categories::New::ViewComponent.new(object: decorate(instance))
    end
  end
end
