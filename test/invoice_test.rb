require_relative 'test_helper'
require '../lib/invoices'

class InvoiceTest < Minitest::test
  def test_has_attributes
    data = {id: "494", customer_id: "949", merchant_id: "8989898",
      created_at: "2014-11-20 18:00:00 UTC", updated_at: "2013-09-18 12:00:08 UTC"
    }

    invoice = Invoices.new(data, slef)

    assert_equal 494, invoice.id
    assert_equal 949, invocie.customer_id
    assert_equal 8989898, invoice.merchant_id
  end

end
