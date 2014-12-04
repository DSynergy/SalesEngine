require_relative 'test_helper'
require_relative '../lib/sales_engine'

class MerchantTest < Minitest::Test
  attr_reader :merchant, :items

  def setup
    engine = SalesEngine.new
    data = {id: 1, name: "Schroeder-Jerde", created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"}
    @merchant = Merchant.new(data,engine)
  end

  def test_has_attributes
    assert_equal 1, @merchant.id
    assert_equal "Schroeder-Jerde", @merchant.name
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.updated_at
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.created_at
  end

end
