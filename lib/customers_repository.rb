require_relative 'MetaRepository'
require_relative 'sales_engine'

class CustomersRepository < MetaRepository
  attr_reader :customers, :engine

  def initialize(customers,engine)
    @customers = customers
    @engine = engine
  end

  def self.build_customers(data,engine)
    customer_objects = data.map do |row|
      Customer.new(row,self)
    end
    self.new(customer_objects,self)
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
