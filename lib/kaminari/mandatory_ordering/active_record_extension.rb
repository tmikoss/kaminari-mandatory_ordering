module Kaminari
  module MandatoryOrdering
    module ActiveRecordExtension
      extend ActiveSupport::Concern

      included do
        descendants.each do |klass|
          klass.send(:include, Kaminari::MandatoryOrdering::ActiveRecordModelExtension) if klass.superclass == ::ActiveRecord::Base
        end
      end

      class_methods do
        def inherited(klass)
          super
          klass.send(:include, Kaminari::MandatoryOrdering::ActiveRecordModelExtension) if klass.superclass == ::ActiveRecord::Base
        end
      end
    end
  end
end
