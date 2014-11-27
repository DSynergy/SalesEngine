class Merchant

  attr_reader :id, :name, :created_at, :updated_at

  def initialize(data)
    @id = data[:id].to_i
    @name = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]

  end


def revenue(date)
  #revenue returns the total revenue for that merchant across all transactions
  #revenue(date) returns the total revenue for that merchant for a specific invoice date

end

def favorite_customer
  #favorite_customer returns the Customer who has conducted the most successful transactions
end

def customers_with_pending_invoices
  #customers_with_pending_invoices returns a collection of Customer instances which have pending (unpaid) invoices. An invoice is considered pending if none of it’s transactions are successful.
end

# Merchant extension

# revenue(range_of_dates) returns the total revenue for that merchant across several dates

end
