module Categories::DestroyConcern
  extend ActiveSupport::Concern

  included do
    def destroy_category
      @category.destroy
      respond_to do |format|
        format.html { redirect_to categories_url, notice: t('.success') }
        format.json { head :no_content }
      end
    end
  end
end