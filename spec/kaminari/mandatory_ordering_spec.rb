require 'spec_helper'

describe Kaminari::MandatoryOrdering do
  let(:klass) do
    Class.new(ActiveRecord::Base) do
      self.table_name = 'items'
    end
  end

  before(:all) do
    ActiveRecord::Base.connection.execute <<-SQL
      INSERT INTO items (id) VALUES (1);
    SQL
  end

  it 'should work as expected' do
    scope = klass.order(:id)
    expect(scope.page(1)).not_to be_empty
    expect(scope.page(2)).to be_empty
  end

  it 'should raise error when paging unordered collection' do
    expect { klass.page(1) }.to raise_error(Kaminari::MandatoryOrdering::Error)
  end

  it 'should raise error when paging unordered collection that does not directly inherit ActiveRecord' do
    sublklass = Class.new(klass)
    expect { sublklass.page(1) }.to raise_error(Kaminari::MandatoryOrdering::Error)
  end

  it 'should not raise error when paging over ordered collection' do
    expect { klass.order(:id).page(1) }.not_to raise_error
  end

  it 'should not raise error if klass has default scope order' do
    klass.define_singleton_method(:default_scope) { order(:id) }

    expect { klass.page(1) }.not_to raise_error
  end

  context 'when disabled' do
    around(:each) do |example|
      Kaminari::MandatoryOrdering.enabled = false
      example.run
      Kaminari::MandatoryOrdering.enabled = true
    end

    it 'should not raise error when paging unordered collection' do
      expect { klass.page(1) }.not_to raise_error
    end
  end

  context 'when custom page_method_name configured' do
    around(:each) do |example|
      Kaminari.configure { |config| config.page_method_name = :lapa }
      example.run
      Kaminari.configure { |config| config.page_method_name = :page }
    end

    it 'should not raise error when paging unordered collection' do
      expect { klass.lapa(1) }.to raise_error(Kaminari::MandatoryOrdering::Error)
    end
  end
end
