$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_record'
require 'active_support/all'
require 'kaminari/mandatory_ordering'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :items, force: true do |t|
  end
end
