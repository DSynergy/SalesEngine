require_relative 'MetaRepository'

class TransactionsRepository < MetaRepository
  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def self.build_transactions(data)
    transaction_objects = data.map do |row|
      Transaction.new(row)
    end
    self.new(transaction_objects)
  end


  def invoice
    # returns an instance of Invoice associated with this object
  end


end
