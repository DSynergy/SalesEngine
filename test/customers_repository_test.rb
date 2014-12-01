require_relative 'test_helper'
require '../lib/csv_handler'
require '../lib/customers_repository'
require '../lib/customer'

class CustomersRepositoryTest < Minitest::Test

  def setup
    @customer_data         = CSVHandler.open_csv("../data/fixtures/customers.csv")
    @customers_repository  = CustomersRepository.build_customers(@customer_data)
  end

  def test_it_loads_items
    assert_equal 24, @customers_repository.customers.length
  end

  def test_returns_array_of_customers
    assert @customers_repository.customers.is_a?(Array)
    assert @customers_repository.customers.first.is_a?(Customer)
  end

  def test_it_returns_a_random_customer
    random_customer1 = @customers_repository.customers.random
    random_customer2 = @customers_repository.customers.random
    refute random_customer1 == random_customer2
  end

  def test_finds_customer_by_first_name
    result = @customers_repository.find_by_first_name("Cecelia")
    assert result.first_name, "Cecelia"
  end

  def test_finds_a_single_id
    result = @customers_repository.find_by_id(2)
    assert 2, result.id
  end

  def test_finds_by_last_name
    result = @customers_repository.find_by_last_name("Sipes")
    assert result.last_name, "Sipes"
  end

  def test_finds_all_by_last_name
    result = @customers_repository.find_all_by_last_name("Nader")
    assert 2, result.count
  end
end
