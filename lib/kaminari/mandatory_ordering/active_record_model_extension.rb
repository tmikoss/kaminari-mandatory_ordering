module Kaminari
  module MandatoryOrdering
    module ActiveRecordModelExtension
      extend ActiveSupport::Concern

      def self.prepended(klass)
        return unless Kaminari.config.mandatory_ordering

        original = klass.method(Kaminari.config.page_method_name)

        klass.define_singleton_method(Kaminari.config.page_method_name) do |number|
          if all.values.fetch(:order, []).none?
            raise Kaminari::MandatoryOrdering::Error
          else
            # TODO: Find out why calling `super` fails to find the previously defined method.
            original.call(number)
          end
        end
      end
    end
  end
end
