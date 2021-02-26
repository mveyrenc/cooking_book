module ModelConcern
  extend ActiveSupport::Concern

  included do

    def model_name
      self.class.module_parent.to_s.singularize
    end

    def model_class
      model_name.constantize
    end

    def decorator_class
      "#{model_name}Decorator".constantize
    end

    def decorate(instance)
      decorator_class.decorate(instance)
    end

    def decorate_collection(collection)
      decorator_class.decorate_collection(collection)
    end

    def new_instance
      model_class.new
    end

    def new_instance_from_params
      model_class.new(permit_params)
    end

    def permit_params
      raise 'Need to be implemented'
    end
  end

end