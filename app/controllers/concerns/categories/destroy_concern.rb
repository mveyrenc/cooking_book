module Categories::DestroyConcern
  extend ActiveSupport::Concern

  included do
    def do_destroy
      @category.destroy

      redirect_to categories_url, flash: { notice: t('.success') }
    end
  end
end