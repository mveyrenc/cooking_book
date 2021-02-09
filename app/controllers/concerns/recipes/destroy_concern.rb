module Recipes::DestroyConcern
  extend ActiveSupport::Concern

  included do
    def destroy_recipe
      @recipe.destroy
      respond_to do |format|
        format.html { redirect_to recipes_url, notice: t('.success') }
        format.json { head :no_content }
      end
    end
  end
end