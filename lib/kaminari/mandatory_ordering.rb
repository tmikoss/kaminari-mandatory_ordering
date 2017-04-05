require 'kaminari'
require 'kaminari/mandatory_ordering/version'
require 'kaminari/mandatory_ordering/error'
require 'kaminari/mandatory_ordering/active_record_extension'
require 'kaminari/mandatory_ordering/configuration'

module Kaminari
  module MandatoryOrdering
    ::ActiveRecord::Base.send :include, Kaminari::MandatoryOrdering::ActiveRecordExtension
  end
end
