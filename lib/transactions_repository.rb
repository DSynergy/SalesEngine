require_relative 'MetaRepository'
require_relative 'sales_engine'

class TransactionsRepository < MetaRepository
  attr_reader :transactions, :engine

  def inspect
    "#<#{self.class} #{@transactions.size} rows>"
  end

  def initialize(transactions,engine)
    @transactions = transactions
    @engine = engine
  end

  def self.build_transactions(data,engine)
    transaction_objects = data.map do |row|
      Transaction.new(row,self)
    end
    self.new(transaction_objects,self)
  end


  def invoice
    @engine.transaction_relationships # returns an instance of Invoice associated with this object
  end


end
