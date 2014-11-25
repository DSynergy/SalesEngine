require_relative 'test_helper'

class HandlerTest < Minitest::Test
  attr_reader :customers

  def setup
    @customers = CSV.open("../data/fixtures/customers.csv", headers: true, header_converters: :symbol )
  end

end
