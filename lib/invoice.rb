class Invoice
  attr_reader :id, :merchant_id, :customer_id, :created_at, :updated_at

  def initialize(data)
    @id = data[:id].to_i
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end


end
