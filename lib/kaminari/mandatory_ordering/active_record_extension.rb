require 'kaminari/mandatory_ordering/active_record_model_extension'

module Kaminari
  module MandatoryOrdering
    module ActiveRecordExtension
      extend ActiveSupport::Concern

      included do
        descendants.each do |klass|
          klass.send(:include, Kaminari::MandatoryOrdering::ActiveRecordModelExtension) if klass.superclass == ::ActiveRecord::Base
        end
      end

      module ClassMethods
        def inherited(klass)
          super
          klass.send(:include, Kaminari::MandatoryOrdering::ActiveRecordModelExtension) if klass.superclass == ::ActiveRecord::Base
        end
      end
    end
  end
end
