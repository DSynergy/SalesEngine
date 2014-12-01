require_relative 'MetaRepository'

class CustomersRepository < MetaRepository
  attr_reader :customers

  def initialize(customers)
    @customers = customers
  end

  def self.build_customers(data)
    customer_objects = data.map do |row|
      Customer.new(row)
    end
    self.new(customer_objects)
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
