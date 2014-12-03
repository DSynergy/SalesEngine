require_relative 'test_helper'
require '../lib/sales_engine'
require 'bigdecimal'

class InvoiceItemTest < Minitest::Test
  def test_has_attributes
    data = {id: "146", item_id: "298", invoice_id: "894567", quantity: "5000",
    unit_price: "80000", created_at: "09:00", updated_at: "12:08"}
    engine = SalesEngine.new

    invoice_items = InvoiceItem.new(data,engine)

    assert_equal 146, invoice_items.id
    assert_equal 298, invoice_items.item_id
    assert_equal 894567, invoice_items.invoice_id
    assert_equal 5000, invoice_items.quantity
    assert_equal BigDecimal.new("80000").to_i, invoice_items.unit_price
    assert_equal "09:00", invoice_items.created_at
    assert_equal "12:08", invoice_items.updated_at
  end

end
