require_relative 'invoice_items_repository'
require 'bigdecimal'

class InvoiceItem
  attr_reader :engine, :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

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


# Business Logic

# Invoice - Creating New Invoices & Related Objects
#
# Given a hash of inputs, you can create new invoices on the fly using this syntax:
#
#
# invoice = invoice_repository.create(customer: customer, merchant: merchant, status: "shipped",
# items: [item1, item2, item3])
#
# Assuming that customer, merchant, and item1/item2/item3 are instances of their respective classes.
#
# You should determine the quantity bought for each item by how many times the item is in the :items array. So, for items: [item1, item1, item2], the quantity bought will be 2 for item1 and 1 for item2.
#
# Then, on such an invoice you can call:
#
# invoice.charge(credit_card_number: "4444333322221111",
# credit_card_expiration: "10/13", result: "success")
#
# The objects created through this process would then affect calculations, finds, etc.
