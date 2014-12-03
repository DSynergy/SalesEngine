require_relative 'MetaRepository'
require_relative 'sales_engine'

class TransactionsRepository < MetaRepository
  attr_reader :entries, :engine

  def inspect
    "#<#{self.class} #{@transactions.size} rows>"
  end

  def self.build_transactions(data,engine)
    transaction_objects = data.map do |row|
      Transaction.new(row,engine)
    end
    self.new(transaction_objects,engine)
  end

  def transactions
    @entries
  end

  def find_by_id(id)
    find_by_attribute(:id,id)
  end

  def find_all_by_result(result)
    find_all_by_attribute(:result, result)
  end

  def find_by_credit_card_number(cc)
    find_by_attribute(:credit_card_number, cc)
  end

end
