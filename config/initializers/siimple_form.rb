# config/initializers/simple_form.rb

# The role of the simple_form gem is to make forms easy to work with. It also helps keep the form designs consistent across the application by making sure we always use the same CSS classes. 

# see also config/locales/simple_form.en.yml

SimpleForm.setup do |config|
  # Wrappers configuration

  # The wrappers configuration lists the input wrappers that we can use in our application. For example, calling f.input :name for the Quote model with the :default wrapper will generate the following HTML:

  # <div class="form__group">
  #   <label class="visually-hidden" for="quote_name">
  #     Name
  #   </label>
  #   <input class="form__input" type="text" name="quote[name]" id="quote_name">
  # </div>

  # The default configuration part contains options to configure the submit buttons' default classes, the labels, the way checkboxes and radio buttons are rendered... The most important one here is the config.default_wrapper = :default. It means that when we type f.input :name without specifying a wrapper, the :default wrapper seen above will be used to generate the HTML.

  config.wrappers :default, class: "form__group" do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: "visually-hidden"
    b.use :input, class: "form__input", error_class: "form__input--invalid"
  end

  # Default configuration
  config.generate_additional_classes_for = []
  config.default_wrapper                 = :default
  config.button_class                    = "btn"
  config.label_text                      = lambda { |label, _, _| label }
  config.error_notification_tag          = :div
  config.error_notification_class        = "error_notification"
  config.browser_validations             = false
  config.boolean_style                   = :nested
  config.boolean_label_class             = "form__checkbox-label"
end