class ItemsRepository < MetaRepository

  def invoice_items
    # returns a collection of InvoiceItems associated with this object
  end


  def merchant
    # returns an instance of Merchant associated with this object  end
  end

  Business logic

  def most_revenue(x)
    # returns the top x item instances ranked by total revenue generated
  end

  def most_items(x)
    # returns the top x item instances ranked by total number sold
  end


end
