require_relative 'MetaRepository'

class InvoicesRepository < MetaRepository
  attr_reader :invoices

  def initialize(invoices)
    @invoices = invoices
  end

  def self.build_invoices(data)
    invoice_objects = data.map do |row|
      Invoice.new(row)
    end
    self.new(invoice_objects)
  end


  def transactions
    # returns a collection of associated Transaction instances
  end

  def invoice_items
    # returns a collection of associated InvoiceItem instances
  end

  def items
    # returns a collection of associated Items by way of InvoiceItem objects
  end

  def customer
    # returns an instance of Customer associated with this object
  end

  def merchant
    # returns an instance of Merchant associated with this object
  end


  # Invoice Extension
  #
  # pending returns an array of Invoice instances for which there is no successful transaction
  # average_revenue returns a BigDecimal of the average total for each processed invoice
  # average_revenue(date) returns a BigDecimal of the average total for each processed invoice for a single date
  # average_items returns a BigDecimal of the average item count for each processed invoice
  # average_items(date) returns a BigDecimal of the average item count for each processed invoice for a single date
  #
  # NOTE: All BigDecimal objects should use two decimal places. "Processed invoice" refers to an invoice that has at least one successful transaction.
  #



end
