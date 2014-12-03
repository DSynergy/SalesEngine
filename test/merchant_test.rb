require_relative 'test_helper'
require'../lib/sales_engine'

class MerchantTest < Minitest::Test
  attr_reader :merchant, :items

  def setup
    data = {id: 1, name: "Schroeder-Jerde", created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"}
    # @repository = Minitest::Mock.new
    @merchant = Merchant.new(data,engine)
    @engine = SalesEngine.new
  end

  def test_has_attributes
    assert_equal 1, merchant.id
    assert_equal "Schroeder-Jerde", merchant.name
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end



  # def test_can_find_associated_items
  #   repository.expect(:find_items_by_merchant_id, [], [merchant.id]) #calling from Merchants.new
  #   merchant.items
  #   repository.verify
  # end

end
