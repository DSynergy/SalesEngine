require_relative 'MetaRepository'

class CustomersRepository < MetaRepository

def initialize(filename)
  CSV.open(filename, headers: true, header_converters: :symbol)
end


  def invoices
    # returns a collection of Invoice instances associated with this object.end
  end

  # Customer Extension
  #
  # most_items returns the Customer who has purchased the most items by quantity
  # most_revenue returns the Customer who has generated the most total revenue
  #



end



# path = File.join(__dir__, filename)
