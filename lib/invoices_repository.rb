require_relative 'sales_engine'
require_relative 'MetaRepository'

class InvoicesRepository < MetaRepository
  attr_reader :engine, :entries

  def inspect
    "#<#{self.class} #{@invoices.size} rows>"
  end

  def self.build_invoices(data,engine)
    invoice_objects = data.map do |row|
      Invoice.new(row,engine)
    end
    self.new(invoice_objects,engine)
  end

  def invoices
    @entries
  end

  def find_by_status(status)
    find_by_attribute(:status, status)
  end

  def find_all_by_status(status)
    find_all_by_attribute(:status, status)
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def find_all_by_customer_id(id)
    find_all_by_attribute(:customer_id, id)
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
