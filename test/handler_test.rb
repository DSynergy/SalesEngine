require_relative 'test_helper'
require '../lib/csv_handler'

class HandlerTest < Minitest::Test
  attr_reader :customers

  def setup
    @customers = CSV.open("../data/fixtures/customers.csv", headers: true, header_converters: :symbol )
  end

  def test_it_can_load_a_repo
    assert_equal 25, @customers.split.size
  end

end
