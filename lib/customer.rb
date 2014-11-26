class Customer

attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(data)
    @id = data[:id].to_i
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]

  end

# customer = Customer.new(row)


  def transactions
    #returns an array of Transaction instances associated with the customer
  end

  def favorite_merchant
    #returns an instance of Merchant where the customer has conducted the most successful transactions
  end

  # Customer extension

  #days_since_activity returns a count of the days since their last transaction, zero means today.
  #pending_invoices returns an array of Invoice instances for which there is no successful transaction


end
