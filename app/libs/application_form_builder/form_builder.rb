require 'bulma_form_builder/form_field'

module ApplicationFormBuilder
  class FormBuilder < BulmaFormBuilder::FormBuilder
    include ApplicationFormBuilder::FormField

    include ApplicationFormBuilder::Inputs::Selects::Collection
    include ApplicationFormBuilder::Inputs::Selects::GroupedCollection
    include ApplicationFormBuilder::Inputs::Selects::Select
    include ApplicationFormBuilder::Inputs::Markdown
    include ApplicationFormBuilder::Inputs::Submit
  end
end
