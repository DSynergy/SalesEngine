require_relative 'test_helper'
require '../lib/csv_handler'
require '../lib/merchants_repository'

class MerchantsRepositoryTest < Minitest::Test

  def merchant_repository
    rows = CSVHandler.load("../data/fixtures/merchants.csv")
    merchant_repository = MerchantsRepository.new("engine", rows)
  end

  def test_it_loads_the_repo
    assert equal 25, merchant_repository.merchants.length
  end

  def test_it_returns_basic_info
    information = merchant_repository.inspect
    assert_equal "<MerchantRepository 25 rows>", information
  end

  def test_it_returns_a_random_customer
    random_merchant1 = merchant_repository.random
    random_merchant2 = merchant_repository.random
    refute random_merchant1 == random_merchant2
  end

  def test_it_finds_by_first_name
    result = merchant_repository.find_by_name("Bernhard-Johns")
    assert_equal "Bernhard-Johns", result.name
  end

  def test_it_finds_merchants_by_id
    result = merchant_repository.find_by_id(7)
    assert_equal 7, result.id
  end

end
