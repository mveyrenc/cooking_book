module MainMenu::SideMenu
  class BookBaseMenuComponent < ViewComponent::Base
    include ActionController::Helpers
    include Devise::Controllers::Helpers
    include CanCan::ControllerAdditions

    def render?
      can? :read, Recipe
    end

    private

    def book
      raise 'Method missing'
    end

    def link_to_recipes
      render MainMenu::SideMenu::MenuItemComponent.new(title: t('menu.recipes'), path: book_recipes_path(book)) if can? :read, Recipe
    end

    def link_to_create
      render MainMenu::SideMenu::MenuItemComponent.new(title: t('menu.new_recipe'), path: new_book_recipe_path(book)) if can? :create, Recipe
    end

    def link_to_import
      render MainMenu::SideMenu::MenuItemComponent.new(title: t('menu.import_recipe'), path: book_import_recipe_index_path(book)) if can? :create, Recipe
    end
  end
end