require_relative 'test_helper'
require_relative '../lib/sales_engine'

class TransactionsRepositoryTest < Minitest::Test

  def setup(dir=File.join(__dir__, '..', 'data'))
    @transaction_data         = CSVHandler.open_csv("#{dir}/fixtures/transactions.csv")
    @transactions_repository  = TransactionsRepository.build_transactions(@transaction_data,self)
  end
  
  def test_it_can_load_a_repository
    assert_equal 24, @transactions_repository.transactions.count
  end

  def test_returns_a_random_transaction
    count = 10.times.count do |i|
      random_transaction1 = @transactions_repository.random
      random_transaction2 = @transactions_repository.random
      random_transaction1 == random_transaction2
    end
    assert count < 2
  end

  def test_finds_transactions_by_id
    result = @transactions_repository.find_by_id(1)
    assert_equal 1, result.id
  end

  def test_finds_transactions_by_credit_card_number
    result = @transactions_repository.find_by_credit_card_number('4354495077693036')
    assert_equal '4354495077693036', result.credit_card_number
  end

  def test_find_all_transactions_with_a_specified_result
    result = @transactions_repository.find_all_by_result('failed')
    assert_equal 4, result.count
  end
end
