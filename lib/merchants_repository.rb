require_relative 'MetaRepository'

class MerchantsRepository < MetaRepository

  def initialize(filename)
    CSV.open(filename, headers: true, header_converters: :symbol)
  end

  

  def items
    # Returns a collection of Item instances associated with that merchant for the products they sell
  end

  def invoice
    # returns a collection of Invoice instances associated with that merchant from their known orders
  end

end

# Business logic
#
#   def most_revenue(number)
#     # returns the top x merchant instances ranked by total revenue
#   end
#
#   def most_items(number)
#     # returns the top x merchant instances ranked by total number of items sold
#   end
#
#   def revenue(date)
#     # returns the total revenue for that date across all merchants
#   end
#
#   # Merchant Extension
#   #
#   # dates_by_revenue returns an array of Ruby Date objects in descending order of revenue
#   # dates_by_revenue(x) returns the top x days of revenue in descending order
#   # revenue(range_of_dates) returns the total revenue for all merchants across several dates
#
#
#
#
# end
