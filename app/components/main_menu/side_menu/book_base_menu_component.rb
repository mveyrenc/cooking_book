module MainMenu::SideMenu
  class BookBaseMenuComponent < ApplicationComponent
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
      render MainMenu::SideMenu::MenuItemComponent.new(title: t('menu.recipes'), path: recipes_path) if can? :read, Recipe
    end
  end
end