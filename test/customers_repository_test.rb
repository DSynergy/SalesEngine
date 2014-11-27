require_relative 'test_helper'
require '../lib/csv_handler'
require '../lib/customers_repository'

class CustomersRepositoryTest < Minitest::Test

  def setup
    rows = CSVHandler.load("../data/fixtures/customers.csv")
    @repository = CustomersRepository.new("engine", rows)
  end

  def test_it_loads_items
    assert_equal 25, repository.length
  end

  def test_returns_array_of_customers
    assert repository.customers.is_a?(Array)
    assert repository.customers.first.is_a?(Customer)
  end

  def test_it_returns_a_random_customer
    random_customer1 = repository.random
    random_customer2 = repository.random
    refute random_customer1 == random_customer2
  end

  def test_finds_customer_by_first_name
    result = repository.find_by_first_name("Cecelia")
    assert result.first_name, "Cecelia"
  end

  def test_finds_a_single_id
    result = repository.find_by_id(2)
    assert 2, result.id
  end

  def test_finds_by_last_name
    result = repository.find_by_last_name("Sipes")
    assert result.last_name, "Sipes"
  end

  def test_finds_all_by_last_name
    result = repository.find_all_by_last_name("Nader")
    assert 2, result.count
  end
end
