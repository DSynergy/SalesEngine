require_relative 'test_helper'
require_relative '../lib/sales_engine'

class HandlerTest < Minitest::Test
  attr_reader :customers

  def setup(dir=File.join(__dir__, '..', 'data'))
    @customers = CSV.open("#{dir}/fixtures/customers.csv", headers: true, header_converters: :symbol )
  end

  def test_it_can_load_a_repo
    assert_equal 24, @customers.count
  end

end
