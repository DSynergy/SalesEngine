require_relative 'test_helper'
require '../lib/transaction'

class TransactionTest < Minitest::Test

  def test_has_atributes
    data = {id: 123, invoice_id: 4567, credit_card_number: "8675309",
    credit_card_expiration_date: "05/14", result: "failure", created_at:
    "9:01", updated_at: "9:02"}

    transaction = Transaction.new(data)

    assert_equal 123, transaction.id
    assert_equal 4567, transaction.invoice_id
    assert_equal "8675309", transaction.credit_card_number
    assert_equal "05/14", transaction.credit_card_expiration_date
    assert_equal "failure", transaction.result
    assert_equal "9:01", transaction.created_at
    assert_equal "9:02", transaction.updated_at
  end

end
