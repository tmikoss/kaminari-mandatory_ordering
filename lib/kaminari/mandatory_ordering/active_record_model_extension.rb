module Kaminari
  module MandatoryOrdering
    module ActiveRecordModelExtension
      extend ActiveSupport::Concern
      included do |base|
        if Kaminari.config.mandatory_ordering
          orig = base.method(Kaminari.config.page_method_name)
          base.define_singleton_method(Kaminari.config.page_method_name) do |num = nil|
            if all.values.fetch(:order, []).none?
              raise Kaminari::MandatoryOrdering::Error
            else
              orig.call(num)
            end
          end
        end
      end
    end
  end
end
