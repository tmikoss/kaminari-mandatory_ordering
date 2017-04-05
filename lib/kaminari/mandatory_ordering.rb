require 'kaminari'
require 'active_support/lazy_load_hooks'
require 'kaminari/mandatory_ordering/version'
require 'kaminari/mandatory_ordering/error'
require 'kaminari/mandatory_ordering/active_record_extension'

module Kaminari
  module MandatoryOrdering
    ::ActiveRecord::Base.send :include, Kaminari::MandatoryOrdering::ActiveRecordExtension
  end
end
