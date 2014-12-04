require_relative 'invoices_repository'

class Invoice
  attr_reader :engine, :id, :merchant_id, :customer_id, :created_at, :updated_at, :status

  def initialize(data,engine)
    @id = data[:id].to_i
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @status = data[:status]
    @engine = engine
  end

  def transactions
    @engine.invoice_relationships_transactions(self)
    # returns a collection of associated Transaction instances
  end

  def invoice_items
    @engine.invoice_relationships_invoice_items(self)
    # returns a collection of associated InvoiceItem instances
  end

  def items
    @engine.invoice_relationships_items(self)
    # returns a collection of associated Items by way of InvoiceItem objects
  end

  def customer
    @engine.invoice_relationships_customers(self)
    # returns an instance of Customer associated with this object
  end

  def merchant
    @engine.invoice_relationships_merchants(self) 
    # returns an instance of Merchant associated with this object
  end

end
