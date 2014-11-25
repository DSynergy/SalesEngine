class Customer

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
