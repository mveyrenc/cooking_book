module Recipes
  class ShowController < SecuredController

    include FriendlyInstanceConcern

    def call
      authorize! :read, instance
      breadcrumb I18n.t('breadcrumb.recipes'), :recipes_path, match: :exclusive
      breadcrumb instance.name, recipe_path

      part = params[:part] || Recipes::Parts::DetailComponent::PART_RECIPE

      render Recipes::Show::ViewComponent.new(object: decorate(instance), part: part)
    end
  end
end
