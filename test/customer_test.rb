require_relative 'test_helper'
require '../lib/customer'

class CustomerTest < Minitest::Test

  def test_has_attributes
    data = {id: "42", first_name: "Billy", last_name: "Bob",
    created_at: "12:01", updated_at: "12:02"}

    customer = Customer.new(data)

    assert_equal 42, customer.id
    assert_equal "Billy", customer.first_name
    assert_equal "Bob", customer.last_name
    assert_equal "12:01", customer.created_at
    assert_equal "12:02", customer.updated_at
  end
end
