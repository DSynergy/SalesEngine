require_relative 'invoices_repository'

class Invoice
  attr_reader :engine,
              :id,
              :merchant_id,
              :customer_id,
              :created_at,
              :updated_at,
              :status

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
  end

  def invoice_items
    @engine.invoice_relationships_invoice_items(self)
  end

  def items
    @engine.invoice_relationships_items(self)
  end

  def customer
    @engine.invoice_relationships_customers(self)
  end

  def merchant
    @engine.invoice_relationships_merchants(self)
  end

end
