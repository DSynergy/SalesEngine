require_relative 'test_helper'
require '../lib/invoice'

class InvoiceTest < Minitest::Test
  def test_has_attributes
    data = {id: "494", customer_id: "949", merchant_id: "8989898",
      created_at: "2014-11-20 18:00:00 UTC", updated_at: "2013-09-18 12:00:08 UTC"
    }

    invoice = Invoice.new(data)

    assert_equal 494, invoice.id
    assert_equal 949, invoice.customer_id
    assert_equal 8989898, invoice.merchant_id
    assert_equal "2014-11-20 18:00:00 UTC", invoice.created_at
    assert_equal "2013-09-18 12:00:08 UTC", invoice.updated_at

  end

end
