require_relative 'test_helper'

class TransactionRepositoryTest < Minitest::Test

  def transaction_repository
    rows = CSVHandler.load("../data/fixtures/transactions.csv")
    repository = TransactionRepository.new("engine", rows)
  end

  def test_it_can_load_a_repository
    assert_equal 25, repository.transactions.length
  end

  def test_returns_basic_information
    information = repository.inspect
    assert_equal "#<TransactionRepository 25 rows>", information
  end

  def test_returns_a_random_transaction
    random_transaction1 = repository.random
    random_transaction2 = repository.random
    refute random_transaction1 == random_transaction2
  end

  def test_returns_all_transactions_in_the_repository
    assert_equal 25, repository.all.count
  end

  def test_finds_transactions_by_id
    result = repository.find_by_id(1)
    assert_equal 1, result.id
  end

  def test_finds_transactions_by_credit_card_number
    result = repository.find_by_credit_card_number('4354495077693036')
    assert_equal '4354495077693036', result.credit_card_number
  end

  def test_find_all_transactions_with_a_specified_result
    result = repository.find_all_by_result('failed')
    assert_equal 4, result.count
  end
end
