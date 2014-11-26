require_relative 'test_helper'
require '../lib/items'

class ItemsTest < Minitest::test
    def test_has_attributes
      data = {id: 540, name: "box", description: "cardboard",
      unit_price: "80000", merchant_id: 1,
      created_at: "11:45", updated_at: "10:07"}

      item = Items.new(data, self)

      assert_equal 540, item.id
      assert_equal "box", item.name
      assert_equal "cardboard", item.description
      assert_equal ("80000").to_i/100, item.unit_price.to_i
      assert_equal 1, item.merchant_id
      assert_equal "11:45", item.created_at
      assert_equal "10:07", item.updated_at
  end

end
