require_relative 'merchants_repository'

class Merchant

  attr_reader :engine, :id, :name, :created_at, :updated_at

  def initialize(data,engine)
    @id = data[:id].to_i
    @name = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @engine = engine
  end

  def items
    @engine.merchant_relationships_items(self)
  end

  def invoices
    @engine.merchant_relationships_invoices(self)
  end

end
