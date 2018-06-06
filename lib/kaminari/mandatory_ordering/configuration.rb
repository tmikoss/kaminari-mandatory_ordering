# Kaminari version 1.1.1 removed ActiveSupport integration
if defined?(ActiveSupport::Configurable::Configuration) && Kaminari.config.class.ancestors.include?(ActiveSupport::Configurable::Configuration)
  Kaminari.config.instance_eval do
    self.mandatory_ordering = true
  end
else
  Kaminari.config.class.class_eval do
    attr_accessor :mandatory_ordering
  end
  Kaminari.config.instance_variable_set(:@mandatory_ordering, true)
end
