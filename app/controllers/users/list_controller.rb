module Users
  class ListController < SecuredController

    include ModelConcern

    breadcrumb I18n.t('breadcrumb.users'), :users_path, match: :exclusive

    def call
      authorize! :read, model_class

      render  Users::Views::ListComponent.new(
        objects: User.all.decorate
      )
    end
  end
end