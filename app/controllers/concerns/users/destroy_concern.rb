module Users::DestroyConcern
  extend ActiveSupport::Concern

  included do
    def do_destroy
      @user.destroy

      redirect_to users_url, flash: { notice: t('.success') }
    end
  end
end