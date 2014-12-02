require_relative 'invoices_repository'

class Invoice
  attr_reader :engine, :id, :merchant_id, :customer_id, :created_at, :updated_at

  def initialize(data,engine)
    @id = data[:id].to_i
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @engine = engine
  end


end
