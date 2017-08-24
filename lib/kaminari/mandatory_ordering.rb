require 'kaminari/mandatory_ordering/version'
require 'active_support/lazy_load_hooks'

ActiveSupport.on_load :active_record do
  require 'kaminari/mandatory_ordering/error'
  require 'kaminari/mandatory_ordering/active_record_extension'
  require 'kaminari/mandatory_ordering/configuration'
  ::ActiveRecord::Base.send :include, Kaminari::MandatoryOrdering::ActiveRecordExtension
end
