require_relative 'test_helper'
require '../lib/csv_handler'
require '../lib/merchants_repository'
require_relative '../lib/merchant'

class MerchantsRepositoryTest < Minitest::Test

  def setup
    @merchant_data        = CSVHandler.open_csv("../data/fixtures/merchants.csv")
    @merchants_repository = MerchantsRepository.build_merchants(@merchant_data)
  end


  def test_it_loads_the_repo
    assert_equal 24, @merchants_repository.merchants.length
  end

  def test_it_returns_a_random_customer
    random_merchant1 = @merchants_repository.merchants.random
    random_merchant2 = @merchants_repository.merchants.random
    refute random_merchant1 == random_merchant2
  end

  def test_it_finds_by_first_name
    result = @merchants_repository.find_by_name("Bernhard-Johns")
    assert_equal "Bernhard-Johns", result.name
  end

  def test_it_finds_merchants_by_id
    result = @merchants_repository.find_by_id(7)
    assert_equal 7, result.id
  end

end
