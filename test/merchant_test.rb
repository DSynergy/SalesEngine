require_relative 'test_helper'
require '../lib/merchant'

class MerchantTest < Minitest::Test
  attr_reader :merchant, :repository

  def setup
    data = {id: 4, name: "Cummings-Thiel", created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"}
    # @repository = Minitest::Mock.new
    @merchant = Merchant.new(data)
  end

  def test_has_attributes
    assert_equal 4, merchant.id
    assert_equal "Cummings-Thiel", merchant.name
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  # def test_can_find_associated_items
  #   repository.expect(:find_items_by_merchant_id, [], [merchant.id]) #calling from Merchants.new
  #   merchant.items
  #   repository.verify
  # end

end
