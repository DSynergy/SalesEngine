require_relative 'test_helper'
require'../lib/sales_engine'

class HandlerTest < Minitest::Test
  attr_reader :customers

  def setup
    @customers = CSV.open("../data/fixtures/customers.csv", headers: true, header_converters: :symbol )
  end

  def test_it_can_load_a_repo
    assert_equal 24, @customers.count
  end

end
