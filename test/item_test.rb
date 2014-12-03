require_relative 'test_helper'
require '../lib/sales_engine'
require 'bigdecimal'

class ItemTest < Minitest::Test

  def setup
    engine = SalesEngine.new
    data = {id: "540", name: "box", description: "cardboard",
      unit_price: "80000", merchant_id: "1", created_at: "11:45", updated_at: "10:07"}
    @item = Item.new(data,engine)
  end

  def test_has_attributes
      assert_equal 540, @item.id
      assert_equal "box", @item.name
      assert_equal "cardboard", @item.description
      assert_equal BigDecimal.new("80000").to_i, @item.unit_price
      assert_equal 1, @item.merchant_id
      assert_equal "11:45", @item.created_at
      assert_equal "10:07", @item.updated_at
  end

end
