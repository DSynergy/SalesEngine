require_relative 'MetaRepository'

class TransactionsRepository < MetaRepository
  attr_reader :transaction

  def initialize(transaction)
    @transaction = transaction
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
