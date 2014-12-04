require_relative 'invoice_items_repository'
require 'bigdecimal'

class InvoiceItem
  attr_reader :engine,
              :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at

  def initialize(data,engine)
    @id = data[:id].to_i
    @item_id = data[:item_id].to_i
    @invoice_id = data[:invoice_id].to_i
    @quantity = data[:quantity].to_i
    @unit_price = BigDecimal.new(data[:unit_price].to_i)
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @engine = engine
  end

  def item
    @engine.invoice_item_relationships_items(self)
  end

  def invoice
    @engine.invoice_item_relationships_invoices(self)
  end
end
