module Recipes::DestroyConcern
  extend ActiveSupport::Concern

  included do
    def do_destroy
      @recipe.destroy

      redirect_to @book, flash: { notice: t('.success') }
    end
  end
end