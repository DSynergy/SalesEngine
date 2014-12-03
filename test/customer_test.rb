require_relative 'test_helper'
require_relative '../lib/sales_engine'

class CustomerTest < Minitest::Test

  def setup
    engine = SalesEngine.new
    data = {id: "42", first_name: "Billy", last_name: "Bob",
      created_at: "12:01", updated_at: "12:02"}
    @customer = Customer.new(data,engine)
  end

  def test_has_attributes
    assert_equal 42, @customer.id
    assert_equal "Billy", @customer.first_name
    assert_equal "Bob", @customer.last_name
    assert_equal "12:01", @customer.created_at
    assert_equal "12:02", @customer.updated_at
  end

end
