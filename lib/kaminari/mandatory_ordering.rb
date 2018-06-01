require 'active_support/lazy_load_hooks'

module Kaminari
  module MandatoryOrdering
    require_relative './mandatory_ordering/version'
    require_relative './mandatory_ordering/error'
    require_relative './mandatory_ordering/active_record_extension'
    require_relative './mandatory_ordering/active_record_model_extension'

    class << self
      attr_accessor :enabled
    end
  end
end

Kaminari::MandatoryOrdering.enabled = true

ActiveSupport.on_load :active_record do
  ::ActiveRecord::Base.send :include, Kaminari::MandatoryOrdering::ActiveRecordExtension
end
