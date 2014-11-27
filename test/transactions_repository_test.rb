require_relative 'test_helper'           # => true
require '../lib/csv_handler'              # ~> LoadError: cannot load such file -- ./lib/csv_handler
require '../lib/transactions_repository'

class TransactionsRepositoryTest < Minitest::Test

  def transaction_repository
    rows = CSVHandler.load("../data/fixtures/transactions.csv")
    repository = TransactionsRepository.new("engine", rows)
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

# >> Run options: --seed 27440
# >>
# >> # Running:
# >>
# >>
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.000695s, 0.0000 runs/s, 0.0000 assertions/s.
# >>
# >> 0 runs, 0 assertions, 0 failures, 0 errors, 0 skips

# ~> LoadError
# ~> cannot load such file -- ./lib/csv_handler
# ~>
# ~> /Users/DBomb/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0/rubygems/core_ext/kernel_require.rb:55:in `require'
# ~> /Users/DBomb/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0/rubygems/core_ext/kernel_require.rb:55:in `require'
# ~> /Users/DBomb/turing/Module 1 - Ruby and TDD/Sales_Engine/sales_engine/test/transactions_repository_test.rb:2:in `<main>'
