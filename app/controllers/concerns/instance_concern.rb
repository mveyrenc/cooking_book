module InstanceConcern
  extend ActiveSupport::Concern

  include ModelConcern

  included do
    private

    def instance
      @instance ||= model_class.find(params[:id])
    end
  end
end