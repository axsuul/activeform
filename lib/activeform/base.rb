require 'active_attr'

module ActiveForm
  class Base
    include ::ActiveAttr::BasicModel
    include ::ActiveAttr::MassAssignment

    private
    # Map form attributes to model attributes, validate the model, then carry the errors back over
    def self.validates_through(klass, mappings = {})
      mappings.each do |form_attribute, model_attribute|
        attr_accessor form_attribute

        validate validate_method
      end

      validate_method = "validate_through_#{klass.name.underscore}".to_sym

      define_method(validate_method) do
        model = klass.new

        # transfer over form values to model
        mappings.each do |form_attribute, model_attribute|
          model.send("#{model_attribute}=", send(mappings[model_attribute]))
        end

        # validate the model now
        model.valid?

        # carry the errors over back to the form
        mappings.each do |form_attribute, model_attribute|
          model.errors[model_attribute].each do |error|
            errors.add(form_attribute, error)
          end
        end
      end
    end
  end
end